#include <fstream>
#include <iostream>

#include <kitty/constructors.hpp>
#include <kitty/operators.hpp>
#include <mockturtle/algorithms/balancing.hpp>
#include <mockturtle/algorithms/balancing/esop_balancing.hpp>
#include <mockturtle/networks/xag.hpp>
#include <mockturtle/traits.hpp>
#include <mockturtle/utils/node_map.hpp>
#include <mockturtle/views/depth_view.hpp>
#include <mockturtle/views/topo_view.hpp>

#include <fstream>
#include <iostream>

#include <kitty/constructors.hpp>
#include <kitty/operators.hpp>
#include <mockturtle/algorithms/md_optimal_exact_synthesis.hpp>
#include <mockturtle/networks/xag.hpp>
#include <mockturtle/traits.hpp>
#include <mockturtle/utils/node_map.hpp>
#include <mockturtle/views/depth_view.hpp>
#include <mockturtle/views/topo_view.hpp>

#include <experiments.hpp>


#include <experiments.hpp>

typedef struct representatives
{
	std::string func;
	uint32_t mc;
	uint32_t md;
} representatives;

namespace details
{

template<class Ntk>
struct num_and
{
	uint32_t operator()( Ntk const& ntk, typename Ntk::node const& n ) const
	{
		return ( ntk.is_and( n ) ? 1u : 0u );
	}
};

} /* namespace details */



static std::vector<representatives> affine_representatives_5_eventual = {
	{"00000000", 0u, 0u},
	{"80000000", 4u, 3u},
	{"80008000", 3u, 2u},
	{"00808080", 4u, 3u},
	{"80808080", 2u, 2u},
	{"08888000", 3u, 2u},
	{"aa2a2a80", 4u, 3u},
	{"88080808", 4u, 3u},
	{"2888a000", 3u, 2u},
	{"f7788000", 3u, 2u},
	{"a8202020", 4u, 2u},
	{"08880888", 3u, 2u},
	{"bd686868", 4u, 3u},
	{"aa808080", 4u, 3u},
	{"7e686868", 4u, 3u},
	{"2208a208", 4u, 3u},
	{"08888888", 4u, 3u},
	{"88888888", 1u, 1u},
	{"ea404040", 3u, 2u},
	{"2a802a80", 2u, 2u},
	{"73d28c88", 4u, 2u},
	{"ea808080", 3u, 2u},
	{"a28280a0", 4u, 2u},
	{"13284c88", 3u, 2u},
	{"a2220888", 4u, 2u},
	{"aae6da80", 4u, 3u},
	{"58d87888", 4u, 3u},
	{"8c88ac28", 4u, 3u},
	{"8880f880", 4u, 3u},
	{"9ee8e888", 4u, 3u},
	{"4268c268", 4u, 3u},
	{"16704c80", 4u, 2u},
	{"78888888", 3u, 2u},
	{"4966bac0", 4u, 2u},
	{"372840a0", 4u, 2u},
	{"5208d288", 4u, 2u},
	{"7ca00428", 4u, 2u},
	{"f8880888", 3u, 2u},
	{"2ec0ae40", 4u, 2u},
	{"f888f888", 3u, 2u},
	{"58362ec0", 4u, 3u},
	{"0eb8f6c0", 4u, 3u},
	{"567cea40", 4u, 3u},
	{"f8887888", 4u, 3u},
	{"78887888", 2u, 1u},
	{"e72890a0", 4u, 2u},
	{"268cea40", 3u, 2u},
	{"6248eac0", 4u, 2u}
};



template<class Ntk, class NodeCostFn>
void compute_input_to_output_delay( Ntk const& ntk_md, std::vector<uint32_t>& delay )
{
	mockturtle::node_map<uint32_t, mockturtle::xag_network> required( ntk_md, UINT32_MAX );
	mockturtle::topo_view<Ntk> ntk_topo{ ntk_md };
	uint32_t md = ntk_topo.depth();

	ntk_topo.foreach_po( [&]( auto const po ) {
		required[po] = md;
	} );

	ntk_topo.foreach_node_reverse( [&]( auto const& n ) {
		uint32_t cost_n = NodeCostFn{}( ntk_topo, n );
		ntk_topo.foreach_fanin( n, [&]( auto const& fi ) {
			required[fi] = std::min( required[fi], required[n] - cost_n );
		} );
	} );

	uint32_t delay_max{ 0u };
	ntk_topo.foreach_pi( [&]( auto const& pi ) {
		delay.emplace_back( md - required[ntk_topo.make_signal( pi )] );
		delay_max = std::max( delay_max, delay.back() );
	} );

	if ( delay_max != md )
	{
		std::cout << "[e] max delay(" << delay_max << ") and MC(" << md << ") are non consistent\n";
		std::cout << "[e] function 'compute_input_to_output_delay' is functionally incorrect\n";
	  abort();
	}
}

int main()
{
  std::ifstream db_mc;
  db_mc.open( "../experiments/db_mc_5", std::ios::in );
  std::string line;
  uint32_t pos{ 0u };
  uint32_t benchmark_cnt{ 1u };

  while ( std::getline( db_mc, line ) )
  {
    representatives benchmark = affine_representatives_5_eventual[benchmark_cnt];
    pos = static_cast<uint32_t>( line.find( 'x' ) );
    auto tt_str = line.substr( ++pos, 8u );
    std::cout << "[i] processing " << benchmark.func << "(" << tt_str << ")\n";

    if ( tt_str != benchmark.func )
    {
      std::cout << "[e] functions don't match\n";
      abort();
    }
    pos += 9u;
    line.erase( 0, pos );
    kitty::static_truth_table<5u> tt_static;
    kitty::create_from_hex_string( tt_static, tt_str );
    auto repr = kitty::exact_spectral_canonization( tt_static );
    std::string repr_str = kitty::to_hex( repr );

    kitty::dynamic_truth_table tt( 5u );
    kitty::create_from_hex_string( tt, tt_str );
    auto num_vars = ( kitty::min_base_inplace( tt ) ).size();
    uint32_t mc_target = benchmark.mc;
    uint32_t md_target = benchmark.md;

    /* Reconstruct the mc-optimal XAG implementation */
    mockturtle::xag_network xag_mc_opt;
    std::vector<mockturtle::xag_network::signal> signals_mc_opt( num_vars );
    std::generate( signals_mc_opt.begin(), signals_mc_opt.end(), [&]() { return xag_mc_opt.create_pi(); } );

    while ( line.size() > 3 )
    {
      uint32_t signal_1, signal_2;
      signal_1 = std::stoul( line.substr( 0, line.find( ',' ) ) );
      line.erase( 0, line.find( ' ' ) + 1 );
      signal_2 = std::stoul( line.substr( 0, line.find( ',' ) ) );
      line.erase( 0, line.find( ' ' ) + 1 );

      mockturtle::xag_network::signal signal1, signal2;
      if ( signal_1 == 0u )
      {
        signal1 = xag_mc_opt.get_constant( false );
      }
      else if ( signal_1 == 1u )
      {
        signal1 = xag_mc_opt.get_constant( true );
      }
      else
      {
        signal1 = signals_mc_opt[signal_1 / 2 - 1] ^ ( signal_1 % 2 != 0 );
      }
      if ( signal_2 == 0u )
      {
        signal2 = xag_mc_opt.get_constant( false );
      }
      else if ( signal_2 == 1u )
      {
        signal2 = xag_mc_opt.get_constant( true );
      }
      else
      {
        signal2 = signals_mc_opt[signal_2 / 2 - 1] ^ ( signal_2 % 2 != 0 );
      }

      if ( signal_1 > signal_2 )
      {
        signals_mc_opt.emplace_back( xag_mc_opt.create_xor( signal1, signal2 ) );
      }
      else
      {
        signals_mc_opt.emplace_back( xag_mc_opt.create_and( signal1, signal2 ) );
      }
    }

    const uint32_t signal_po = std::stoul( line );
  	xag_mc_opt.create_po( signals_mc_opt[signal_po / 2 - 1] ^ ( signal_po % 2 != 0 ) );
    mockturtle::depth_view<mockturtle::xag_network, details::num_and<mockturtle::xag_network>, false> xag_mc_opt_md{ xag_mc_opt };
    uint32_t start_md = xag_mc_opt_md.depth();

    mockturtle::cut_enumeration_params ps;
    ps.cut_size = 5u;
    ps.verbose = false;
    ps.very_verbose = false;
    mockturtle::balancing_params balance_ps;
    balance_ps.cut_enumeration_ps = ps;
    balance_ps.only_on_critical_path = true;
    balance_ps.progress = true;
    mockturtle::xag_network xag_md_opt = mockturtle::balancing<mockturtle::xag_network, details::num_and<mockturtle::xag_network>>( xag_mc_opt, mockturtle::esop_rebalancing<mockturtle::xag_network>{}, balance_ps );
    mockturtle::depth_view<mockturtle::xag_network, details::num_and<mockturtle::xag_network>, false> xag_md_opt_md{ xag_md_opt };
    uint32_t end_md = xag_md_opt_md.depth();
    std::vector<uint32_t> delay;
    compute_input_to_output_delay<decltype( xag_md_opt_md ), details::num_and<decltype( xag_md_opt_md )>>( xag_md_opt_md, delay );
    if ( delay.size() != num_vars )
    {
      std::cout << "[e] number of entries of delay information(" << delay.size() << ") and number of pis(" << num_vars << ") are non consistent\n";
      abort();
    }

    std::cout << "[i] " << start_md << "->" << end_md << std::endl;

    std::ofstream db_md;
    db_md.open( "db_esop_new", std::ios::app );
    db_md << "0x" << repr_str << " ";
    //db_md << "0x" << tt_str << " ";
    db_md << num_vars << " ";
    for ( auto const& delay_each : delay )
    {
      db_md << delay_each << " ";
    }
    db_md << 0 << " ";
    xag_md_opt.foreach_gate( [&]( auto const& f ) {
      xag_md_opt.foreach_fanin( f, [&]( auto const& fi ) {
        db_md << static_cast<uint32_t>( ( fi.index << 1 ) + fi.complement ) << " ";
      } );
    } );
    mockturtle::xag_network::signal po = xag_md_opt.po_at( 0 );
    db_md << static_cast<uint32_t>( ( po.index << 1 ) + po.complement ) << "\n";
    db_md.close();
    benchmark_cnt++;
  }
  return 0;
}