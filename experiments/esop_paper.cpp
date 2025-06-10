#include <lorina/aiger.hpp>
#include <mockturtle/algorithms/balancing.hpp>
#include <mockturtle/algorithms/cleanup.hpp>
#include <mockturtle/algorithms/cut_rewriting.hpp>
#include <mockturtle/algorithms/mapper.hpp>
// #include <mockturtle/algorithms/node_resynthesis/bidecomposition.hpp>
#include <mockturtle/algorithms/node_resynthesis/xag_minmc.hpp>
// #include <mockturtle/algorithms/refactoring.hpp>
#include <mockturtle/algorithms/xag_resub_withDC.hpp>
#include <mockturtle/io/aiger_reader.hpp>
#include <mockturtle/io/verilog_reader.hpp>
#include <mockturtle/networks/aig.hpp>
#include <mockturtle/networks/tracing_xag.hpp>
#include <mockturtle/traits.hpp>
#include <mockturtle/views/depth_view.hpp>
#include <mockturtle/views/fanout_view.hpp>

#include <chrono>
#include <iomanip>

#include <experiments.hpp>

std::ostream* log_out = nullptr;

#define IS_TRACING 1
#define REWRITE_CONVERGE_FIRST 0
#define MD_BEFORE_MC 0
#define MAX_ITER 1

#if IS_TRACING
#define xag_ntk mockturtle::tracing_xag_network
#else
#define xag_ntk mockturtle::xag_network
#endif

struct mc_count
{
  uint32_t operator()( xag_ntk const& ntk, xag_ntk::node const& n ) const
  {
    return ntk.is_and( n ) ? 1u : 0u;
  }
};

struct free_xor_cost
{
  uint32_t operator()( xag_ntk const& ntk, xag_ntk::node const& n ) const
  {
    if ( ntk.is_dead( n ) )
    {
      return 999u;
    }

    return ntk.is_xor( n ) ? 0u : 1u;
  }
};

static const std::string PLDI_benchmarks[] = {
    "cardio", "dsort", "msort", "isort", "bsort", "osort", "hd01", "hd02", "hd03",
    "hd04", "hd05", "hd06", "hd07", "hd08", "hd09", "hd10", "hd11", "hd12",
    "bar", "cavlc", "ctrl", "dec", "i2c", "int2float", "router" };

std::vector<std::string> pldi_benchmarks()
{
  std::vector<std::string> result;
  for ( auto i = 0u; i < 25u; ++i )
  {
    result.emplace_back( PLDI_benchmarks[i] );
  }

  return result;
}

std::string bench_path( std::string const& benchmark_name )
{
  return fmt::format( "../experiments/pldi_benchmarks/{}.v", benchmark_name );
}

void cec( xag_ntk const& ntk, std::string const& benchmark )
{
  mockturtle::write_bench( ntk, "/tmp/test.bench" );
  std::string abc_path = "";
  std::string command = fmt::format( "{}abc -q \"cec -n {} /tmp/test.bench\"", abc_path, bench_path( benchmark ) );

  std::array<char, 128> buffer;
  std::string result;
  std::unique_ptr<FILE, decltype( &pclose )> pipe( popen( command.c_str(), "r" ), pclose );

  if ( !pipe )
  {
    throw std::runtime_error( "popen() failed" );
  }

  while ( fgets( buffer.data(), buffer.size(), pipe.get() ) != nullptr )
  {
    result += buffer.data();
  }

  if ( result.size() < 23 || result.substr( 0u, 23u ) != "Networks are equivalent" )
  {
    fmt::print( "[e] Equivalence checking failed...\n" );
    abort();
  }
}

void save_verilog( xag_ntk const& ntk, std::string const& benchmark, std::string const& dir )
{
  mockturtle::write_bench( ntk, "/tmp/tmp.bench" );
  std::string abc_path = "";
  std::string command = fmt::format( "{}abc -q \"read /tmp/tmp.bench; write_verilog {}.v\"", abc_path, ( dir + benchmark ) );
  std::unique_ptr<FILE, decltype( &pclose )> pipe( popen( command.c_str(), "r" ), pclose );

  if ( !pipe )
  {
    throw std::runtime_error( "popen() failed" );
  }
}

struct ParsedSeqn
{
  xag_ntk ntk;
  std::vector<std::string> innodes;
  std::vector<std::string> outnodes;
};

void parse_seqn( const char* seqn_path, ParsedSeqn& ps )
{
  std::ifstream seqn_f;
  seqn_f.open( seqn_path, std::ios::in );
  std::string line;
  std::unordered_map<std::string, int> sig_name_lookup;
  std::vector<xag_ntk::signal> signals;
  int i = 0;
  while ( std::getline( seqn_f, line ) )
  {
    if ( i == 0 )
    {
      int pos = 0;
      while ( ( pos = line.find( ' ' ) ) != -1 )
      {
        std::string pi = line.substr( 0, pos );
        sig_name_lookup[pi] = ps.innodes.size();
        ps.innodes.push_back( pi );
        line.erase( 0, pos + 1 );
      }
      sig_name_lookup[line] = ps.innodes.size();
      ps.innodes.push_back( line );
      signals.resize( ps.innodes.size() );
      std::generate( signals.begin(), signals.end(), [&]() { return ps.ntk.create_pi(); } );

      int true_s = signals.size();
      signals.push_back( ps.ntk.get_constant( true ) );
      int false_s = signals.size();
      signals.push_back( ps.ntk.get_constant( false ) );

      sig_name_lookup["true"] = true_s;
      sig_name_lookup["1"] = true_s;
      sig_name_lookup["false"] = false_s;
      sig_name_lookup["0"] = false_s;
    }
    else if ( i == 1 )
    {
      int pos = 0;
      while ( ( pos = line.find( ' ' ) ) != -1 )
      {
        ps.outnodes.push_back( line.substr( 0, pos ) );
        line.erase( 0, pos + 1 );
      }
      ps.outnodes.push_back( line );
    }
    else
    {
      int pos = line.find( '=' );
      std::string out = line.substr( 0, pos );
      line.erase( 0, pos + 1 );
      char op = line[0];
      line.erase( 0, 2 );
      pos = line.find( ';' );
      std::string opA = line.substr( 0, pos );
      line.erase( 0, pos + 1 );
      std::string opB = line;

      int sig_ind = 0;
      switch ( op )
      {
      case 'w':
      {
        assert( sig_name_lookup.find( opA ) != sig_name_lookup.end() );
        sig_ind = sig_name_lookup[opA];
        break;
      }
      case '^':
      {
        assert( sig_name_lookup.find( opA ) != sig_name_lookup.end() );
        assert( sig_name_lookup.find( opB ) != sig_name_lookup.end() );
        xag_ntk::signal& sigA = signals[sig_name_lookup[opA]];
        xag_ntk::signal& sigB = signals[sig_name_lookup[opB]];
        sig_ind = signals.size();
        signals.emplace_back( ps.ntk.create_xor( sigA, sigB ) );
        break;
      }
      case '*':
      {
        assert( sig_name_lookup.find( opA ) != sig_name_lookup.end() );
        assert( sig_name_lookup.find( opB ) != sig_name_lookup.end() );
        xag_ntk::signal& sigA = signals[sig_name_lookup[opA]];
        xag_ntk::signal& sigB = signals[sig_name_lookup[opB]];
        sig_ind = signals.size();
        signals.emplace_back( ps.ntk.create_and( sigA, sigB ) );
        break;
      }
      case '!':
      {
        assert( sig_name_lookup.find( opA ) != sig_name_lookup.end() );
        xag_ntk::signal& sigA = signals[sig_name_lookup[opA]];
        sig_ind = signals.size();
        signals.emplace_back( ps.ntk.create_not( sigA ) );
        break;
      }
      default:
      {
        std::cerr << "[e] unrecognized seqn op " << op << std::endl;
        break;
      }
      }
      sig_name_lookup[out] = sig_ind;
    }

    i++;
  }

  for ( auto& po : ps.outnodes )
  {
    assert( sig_name_lookup.find( po ) != sig_name_lookup.end() );
    ps.ntk.create_po( signals[sig_name_lookup[po]] );
  }

  // #if IS_TRACING
  //   ps.ntk.transfer_trace();
  // #endif
}

std::string print_fanin( ParsedSeqn& ps, const xag_ntk::signal& fi )
{
  std::string op = fi.complement ? "!" : "";
  if ( ps.ntk.is_pi( fi.index ) )
  {
    op.append( ps.innodes[ps.ntk.pi_index( fi.index )] );
  }
  else if ( ps.ntk.is_constant( fi.index ) )
  {
    return fi.complement ? "1" : "0";
  }
  else
  {
    uint64_t index = fi.index;
    op.append( fmt::format( "n{}", index ) );
  }
  return op;
}

void write_eqn( const char* eqn_path, ParsedSeqn& ps )
{
  std::ofstream eqn_f;
  eqn_f.open( eqn_path, std::ios::out );
  if ( !eqn_f )
  {
    std::cerr << "[e] could not open eqn " << eqn_path << " for writing\n";
  }

  eqn_f << "INORDER =";
  for ( auto& PI : ps.innodes )
  {
    eqn_f << " " << PI;
  }
  eqn_f << ";\n";

  eqn_f << "OUTORDER =";
  for ( auto& PO : ps.outnodes )
  {
    eqn_f << " " << PO;
  }
  eqn_f << ";\n";

  ps.ntk.foreach_gate( [&]( auto const& f ) {
    std::vector<std::string> ops;
    ps.ntk.foreach_fanin( f, [&]( auto const& fi ) {
      ops.push_back( print_fanin( ps, fi ) );
    } );

    eqn_f << "n" << f << " = ";
    if ( ps.ntk.is_and( f ) )
    {
      assert( ops.size() == 2 );
      eqn_f << ops[0] << " * " << ops[1] << ";\n";
    }
    else if ( ps.ntk.is_xor( f ) )
    {
      assert( ops.size() == 2 );
      eqn_f << ops[0] << " ^ " << ops[1] << ";\n";
      // eqn_f << "(" << ops[0] << " * !" << ops[1];
      // eqn_f << ") + (" << ops[1] << " * !" << ops[0] << ");\n";
    }
    else
    {
      std::cerr << "[e] unknown gate type while writing out eqn\n";
      exit( EXIT_FAILURE );
    }
  } );

  int po_ind = 0;
  ps.ntk.foreach_po( [&]( auto const& po ) {
    eqn_f << ps.outnodes[po_ind] << " = ";
    eqn_f << print_fanin( ps, po );
    eqn_f << ";\n";
    po_ind++;
  } );
}

using namespace mockturtle;

void print_ntk_stats (const xag_ntk& ntk) {
  auto mc_temp = costs<xag_ntk, mc_count>( ntk );
  {
    depth_view<xag_ntk, mc_count, false> ntk_md{ ntk };
    auto md_temp = ntk_md.depth();
    std::cerr << "[MC,MD] " << mc_temp << "," << md_temp << "\n";
  }
}

std::pair<uint32_t, uint32_t> mc_opt( xag_ntk& ntk, uint32_t mc_init )
{
  uint32_t mc_mc_opt{ 0u };
  uint32_t md_mc_opt{ 0u };
  uint32_t mc_tmp{ 0u };

  resubstitution_params ps_resub;
  ps_resub.max_divisors = 100u;
  ps_resub.max_inserts = 4u;
  ps_resub.max_pis = 8u;
  ps_resub.progress = false;
  ps_resub.verbose = false;
  ps_resub.use_dont_cares = true;

  cut_rewriting_params ps_rewrite;
  ps_rewrite.cut_enumeration_ps.cut_size = 6;
  ps_rewrite.cut_enumeration_ps.cut_limit = 12;
  ps_rewrite.verbose = false;
  ps_rewrite.progress = false;
  ps_rewrite.min_cand_cut_size = 2u;

  xag_minmc_resynthesis xag_mc_resyn( fmt::format( "{}/db", EXPERIMENTS_PATH ) );
  exact_library<xag_network> xag_mc_lib( xag_mc_resyn );

  // refactoring_params ps_refactor;
  // ps_refactor.verbose = false;
  // ps_refactor.progress = false;
  // ps_refactor.allow_zero_gain = false;
  // ps_refactor.max_pis = 15u;
  // ps_refactor.use_dont_cares = true;
  // bidecomposition_resynthesis<xag_ntk> xag_bidec_resyn;

  mc_tmp = mc_init;

  uint32_t num_ite = 0u;
#if REWRITE_CONVERGE_FIRST
  while ( mc_tmp > mc_mc_opt )
  {
    if ( num_ite > 0u )
    {
      mc_tmp = mc_mc_opt;
    }

    ++num_ite;
    /* Rewriting in DATE20 */
//    std::cerr << "Doing CUT REWRITING ON : "; 
//    print_ntk_stats(ntk);
    xag_ntk ntk_tmp = cut_rewriting<xag_ntk, xag_minmc_resynthesis, mc_count>( ntk, xag_mc_resyn, ps_rewrite, nullptr );
//    std::cerr << "After CUT REWRITING : "; 
//    print_ntk_stats(ntk_tmp);

    mc_mc_opt = costs<xag_ntk, mc_count>( ntk_tmp );
    depth_view<xag_ntk, mc_count, false> ntk_md{ ntk_tmp };
    md_mc_opt = ntk_md.depth();

    if ( mc_mc_opt < mc_tmp )
    {
      ntk = ntk_tmp;
    }
  }
#endif

  num_ite = 0u;
  mc_mc_opt = 0u;
  while ( mc_tmp > mc_mc_opt )
  {
    if ( num_ite > 0u )
    {
      mc_tmp = mc_mc_opt;
    }

    ++num_ite;
    /* Rewriting in DATE20 */
    xag_ntk ntk_tmp = cut_rewriting<xag_ntk, xag_minmc_resynthesis, mc_count>( ntk, xag_mc_resyn, ps_rewrite, nullptr );

    // /* Refactoring in DATE20 */
    // refactoring( ntk_tmp, xag_bidec_resyn, ps_refactor, nullptr, free_xor_cost() );
    // ntk_tmp = cleanup_dangling( ntk_tmp );

    /* Resubstitution in DATE20 */
    fanout_view<xag_ntk> ntk_fo{ ntk_tmp };
    depth_view<fanout_view<xag_ntk>> ntk_resub{ ntk_fo };
    resubstitution_minmc_withDC( ntk_resub, ps_resub );

    ntk_tmp = cleanup_dangling( ntk_tmp );

    mc_mc_opt = costs<xag_ntk, mc_count>( ntk_tmp );
    depth_view<xag_ntk, mc_count, false> ntk_md{ ntk_tmp };
    md_mc_opt = ntk_md.depth();

    if ( mc_mc_opt < mc_tmp )
    {
      ntk = ntk_tmp;
    }
  }
  return std::make_pair( md_mc_opt, mc_mc_opt );
}

std::pair<uint32_t, uint32_t> md_opt( xag_ntk& ntk, uint32_t md_init, uint32_t mc_init )
{
  mockturtle::balancing_params balance_ps;
  balance_ps.cut_enumeration_ps.cut_size = 6;
  balance_ps.cut_enumeration_ps.cut_limit = 12;
  balance_ps.only_on_critical_path = true;
  balance_ps.progress = false;

  uint32_t md_esop{ 0u };
  uint32_t mc_esop{ 0u };
  uint32_t md_tmp{ 0u };
  uint32_t mc_tmp{ mc_init };

  uint32_t num_ite = 0u;
  md_tmp = md_init;
  {
    while ( md_tmp > md_esop )
    {
      if ( num_ite > 0u )
      {
        md_tmp = md_esop;
      }

      ++num_ite;
      xag_ntk ntk_tmp = mockturtle::balancing<xag_ntk, mc_count>( ntk, mockturtle::esop_rebalancing<xag_ntk>{}, balance_ps );
      depth_view<xag_ntk, mc_count, false> ntk_md{ ntk_tmp };
      md_esop = ntk_md.depth();
      mc_esop = costs<xag_ntk, mc_count>( ntk_tmp );
      
      if ( md_esop < md_tmp || ( md_esop == md_tmp && mc_esop < mc_tmp ) )
      {
        ntk = ntk_tmp;
      }
    }
  }

  mc_esop = costs<xag_ntk, mc_count>( ntk );
  depth_view<xag_ntk, mc_count, false> ntk_md{ ntk };
  md_esop = ntk_md.depth();
  return std::make_pair( md_esop, mc_esop );
}

inline uint32_t he_cost( uint32_t md, uint32_t mc )
{
  return md * md * mc;
}

int main( int argc, char** argv )
{
  using namespace experiments;

  if ( argc < 3 )
  {
    std::cerr << "[e] expected path to input seqn & output rules\n";
    exit( EXIT_FAILURE );
  }
  const char* seqn_path = argv[1];
  const char* eqn_path = argv[2];

  log_out = &std::cout;
#if IS_TRACING
  if ( argc == 4 )
  {
    const char* trace_path = argv[3];
    log_out = new std::ofstream(trace_path);
  }
#endif

  ParsedSeqn seqn;
  parse_seqn( seqn_path, seqn );
  auto& ntk = seqn.ntk;

  uint32_t mc_init{};
  uint32_t md_init{};
  uint32_t mc_final{ 0u };
  uint32_t md_final{ 0u };

  mc_init = costs<xag_ntk, mc_count>( ntk );
  {
    depth_view<xag_ntk, mc_count, false> ntk_md{ ntk };
    md_init = ntk_md.depth();
  }

  std::vector<uint32_t> md_path{ md_init };
  std::vector<uint32_t> mc_path{ mc_init };
  uint32_t num_ite{ 0u };

  xag_ntk ntk_iter;
  do
  {
    if ( num_ite > 0 )
    {
      md_init = md_final;
      mc_init = mc_final;
    }
    num_ite++;

#if MD_BEFORE_MC
    {
      ntk_iter = ntk;
      auto [md_esop, mc_esop] = md_opt( ntk_iter, md_init, mc_init );
      md_path.push_back( md_esop );
      mc_path.push_back( mc_esop );
      auto [md_mc_opt, mc_mc_opt] = mc_opt( ntk_iter, mc_esop );
      md_path.push_back( md_mc_opt );
      mc_path.push_back( mc_mc_opt );
      md_final = md_esop;
      mc_final = mc_esop;
    }
#else
    {
      ntk_iter = ntk;
      auto [md_mc_opt, mc_mc_opt] = mc_opt( ntk_iter, mc_init );
      md_path.push_back( md_mc_opt );
      mc_path.push_back( mc_mc_opt );
      auto [md_esop, mc_esop] = md_opt( ntk_iter, md_mc_opt, mc_mc_opt );
      md_path.push_back( md_esop );
      mc_path.push_back( mc_esop );
      md_final = md_esop;
      mc_final = mc_esop;  
    }
#endif
    fmt::print( "COM [{}] [i={}] ({},{}) [{}] -> ({},{}) [{}]\n", seqn_path, num_ite, md_init, mc_init, he_cost( md_init, mc_init ), md_final, mc_final, he_cost( md_final, mc_final ) );
    if (he_cost(md_final, mc_final) >= he_cost(md_init, mc_init)) {
      md_path.pop_back(); md_path.pop_back();
      mc_path.pop_back(); mc_path.pop_back();
      break;
    } else {
      ntk = ntk_iter;
    }
  } while ( num_ite < MAX_ITER );

  (*log_out) << "COM [i] (MD,MC) : ";
  for ( int i = 0; i < md_path.size(); i++ )
  {
    if ( i != 0 )
    {
      (*log_out) << " -> ";
    }
    (*log_out) << "(" << md_path[i] << "," << mc_path[i] << ")";
  }
  #if IS_TRACING
  if ( argc == 4 )
  {
    (static_cast<std::ofstream*>(log_out))->close();
  }
  #endif

  write_eqn( eqn_path, seqn );

  return 0;
}