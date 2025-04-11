#include <cstdlib>
#include <experiments.hpp>
#include <lorina/verilog.hpp>
#include <mockturtle/algorithms/fhe_rule_miner.hpp>
#include <mockturtle/io/verilog_reader.hpp>
#include <mockturtle/algorithms/balancing.hpp>
#include <mockturtle/algorithms/balancing/esop_balancing.hpp>
#include <mockturtle/algorithms/cleanup.hpp>
#include <mockturtle/algorithms/xag_resub.hpp>
#include <mockturtle/views/depth_view.hpp>
#include <mockturtle/views/fanout_view.hpp>
#include <mockturtle/io/write_verilog.hpp>
#include <mockturtle/utils/cost_functions.hpp>
#include <mockturtle/networks/tracing_xag.hpp>


#include <unistd.h>
#include <variant>

//std::string bench_path( std::string const& benchmark_name )
//{
//  return fmt::format( "{}BEST_RESULTS/EPFL/{}.v", EXPERIMENTS_PATH, benchmark_name );
//}
std::string bench_path( std::string const& benchmark_name )
{
  return fmt::format( "{}lobster_v_mdmc/{}.v", EXPERIMENTS_PATH, benchmark_name );
}

static const std::string LOBSTER_benchmarks[] = {
    "bar", "bsort", "cardio", "cavlc", "ctrl", "dec", "dsort", "hd01", "hd02", "hd03", "hd04",
	 "hd05", "hd06", "hd07", "hd08", "hd09", "hd10", "hd11", "hd12", "i2c", 
	 "int2float", "isort", "msort", "osort", "router" };
std::vector<std::string> lobster_benchmarks()
{
  std::vector<std::string> result;
  for ( auto i = 0u; i < 25u; ++i )
  {
    result.emplace_back( LOBSTER_benchmarks[i] );
  }

  return result;
}

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

using xag_ntk = mockturtle::tracing_xag_network;

struct ParsedSeqn {
    xag_ntk ntk;
    std::vector<std::string> innodes;
    std::vector<std::string> outnodes;
};

void parse_seqn(const char *seqn_path, ParsedSeqn &ps) {
    ps.ntk.enable_tracing();
    std::ifstream seqn_f;
    seqn_f.open(seqn_path, std::ios::in);
    std::string line;
    std::unordered_map<std::string, int> sig_name_lookup;
    std::vector<xag_ntk::signal> signals;
    int i = 0;
    while (std::getline( seqn_f, line )) {
        if (i == 0) {
            int pos = 0;
            while ((pos = line.find( ' ' )) != -1) {
                std::string pi = line.substr( 0, pos);
                sig_name_lookup[pi] = ps.innodes.size();
                ps.innodes.push_back(pi);
                line.erase( 0, pos + 1 );
            }
            sig_name_lookup[line] = ps.innodes.size();
            ps.innodes.push_back(line);
            signals.resize(ps.innodes.size());
            std::generate( signals.begin(), signals.end(), [&]() { return ps.ntk.create_pi(); } );

            int true_s  = signals.size();
            signals.push_back(ps.ntk.get_constant( true ));
            int false_s  = signals.size();
            signals.push_back(ps.ntk.get_constant( false ));

            sig_name_lookup["true"] = true_s;    
            sig_name_lookup["1"] = true_s;    
            sig_name_lookup["false"] = false_s;    
            sig_name_lookup["0"] = false_s;    
        } else if (i == 1) {
            int pos = 0;
            while ((pos = line.find( ' ' )) != -1) {
                ps.outnodes.push_back(line.substr( 0, pos));
                line.erase( 0, pos + 1 );
            }
            ps.outnodes.push_back(line);
        } else {
            int pos = line.find( '=' );
            std::string out = line.substr( 0, pos);
            line.erase(0, pos+1);
            char op = line[0];
            line.erase(0, 2);
            pos = line.find(';');
            std::string opA = line.substr(0, pos);
            line.erase(0, pos+1);
            std::string opB = line;

            int sig_ind = 0;
            switch (op) {
                case 'w': {
                    assert(sig_name_lookup.find(opA) != sig_name_lookup.end());
                    sig_ind = sig_name_lookup[opA];
                    break;
                }
                case '^': {
                    assert(sig_name_lookup.find(opA) != sig_name_lookup.end());
                    assert(sig_name_lookup.find(opB) != sig_name_lookup.end());
                    xag_ntk::signal &sigA = signals[sig_name_lookup[opA]];
                    xag_ntk::signal &sigB = signals[sig_name_lookup[opB]];
                    sig_ind = signals.size();
                    signals.emplace_back( ps.ntk.create_xor( sigA, sigB ) );
                    break;
                }
                case '*': {
                    assert(sig_name_lookup.find(opA) != sig_name_lookup.end());
                    assert(sig_name_lookup.find(opB) != sig_name_lookup.end());
                    xag_ntk::signal &sigA = signals[sig_name_lookup[opA]];
                    xag_ntk::signal &sigB = signals[sig_name_lookup[opB]];
                    sig_ind = signals.size();
                    signals.emplace_back( ps.ntk.create_and( sigA, sigB ) );
                    break;
                }
                case '!': {
                    assert(sig_name_lookup.find(opA) != sig_name_lookup.end());
                    xag_ntk::signal &sigA = signals[sig_name_lookup[opA]];
                    sig_ind = signals.size();
                    signals.emplace_back( ps.ntk.create_not( sigA ) );
                    break;
                }
                default: {
                    std::cerr << "[e] unrecognized seqn op " << op << std::endl;
                    break;
                }
            }
            sig_name_lookup[out] = sig_ind;
        }
         
        i++;
    }

    for (auto &po : ps.outnodes) {
        assert(sig_name_lookup.find(po) != sig_name_lookup.end());
        ps.ntk.create_po(signals[sig_name_lookup[po]]);
    }
    ps.ntk.transfer_trace();
}

std::string print_fanin(ParsedSeqn &ps, const xag_ntk::signal &fi) {
    std::string op = fi.complement ? "!" : "";
    if (ps.ntk.is_pi(fi.index)) {
        op.append(ps.innodes[ps.ntk.pi_index(fi.index)]);
    } else if (ps.ntk.is_constant(fi.index)) {
        return fi.complement ? "1" : "0";
    } else {
        uint64_t index = fi.index;
        op.append(fmt::format("n{}", index));
    }
    return op;
}

void write_eqn(const char *eqn_path, ParsedSeqn &ps) {
    std::ofstream eqn_f;
    eqn_f.open(eqn_path, std::ios::out);
    if (!eqn_f) {
        std::cerr << "[e] could not open eqn " << eqn_path << " for writing\n";
    }

    eqn_f << "INORDER =";
    for (auto &PI: ps.innodes) {
        eqn_f << " " << PI;
    }
    eqn_f << ";\n";

    eqn_f << "OUTORDER =";
    for (auto &PO: ps.outnodes) {
        eqn_f << " " << PO;
    }
    eqn_f << ";\n";

    ps.ntk.foreach_gate( [&]( auto const& f ) {

        std::vector<std::string> ops;
        ps.ntk.foreach_fanin( f, [&]( auto const& fi ) {
            ops.push_back(print_fanin(ps, fi));
        } );

        eqn_f << "n" << f << " = ";
        if (ps.ntk.is_and(f)) {
            assert(ops.size() == 2);
            eqn_f << ops[0] << " * " << ops[1] << ";\n";
        } else if (ps.ntk.is_xor(f)) {
            assert(ops.size() == 2);
            eqn_f << ops[0] << " ^ " << ops[1] << ";\n";
            //eqn_f << "(" << ops[0] << " * !" << ops[1];
            //eqn_f << ") + (" << ops[1] << " * !" << ops[0] << ");\n";
        } else {
            std::cerr << "[e] unknown gate type while writing out eqn\n";
            exit(EXIT_FAILURE);
        }        
    } );

    int po_ind = 0;
    ps.ntk.foreach_po( [&] (auto const& po) {
        eqn_f << ps.outnodes[po_ind] << " = ";
        eqn_f << print_fanin(ps, po);
        eqn_f << ";\n";
        po_ind++;
    });
}

void opt_benchmark(std::string &in_path, std::string &out_path, const int limit) {
    ParsedSeqn seqn;
    xag_ntk &init_xag = seqn.ntk;

    if (in_path[in_path.length()-1] == 'v') {
        if ( lorina::read_verilog( in_path, mockturtle::verilog_reader( init_xag ) ) != lorina::return_code::success )
        {
            std::cerr << "[e] could not parse verilog file " << in_path << "\n";
            return;
        }
    } else {
        parse_seqn(in_path.c_str(), seqn);
    }
    
    xag_ntk xag_md_opt = init_xag;
    //fmt::print( "[i] processing {}\n", in_path );
    mockturtle::cut_enumeration_params ps;
    ps.cut_size = 6u;
    ps.verbose = false;
    ps.very_verbose = false;
    mockturtle::balancing_params balance_ps;
    balance_ps.cut_enumeration_ps = ps;
    balance_ps.only_on_critical_path = true;
    balance_ps.progress = false;

    int md_before_all = 0;
    int mc_before_all = 0;
    int md_after = 0;
    int mc_after = 0;
    int i = 0;
    for (i = 0; i < limit; i++) {

        mockturtle::depth_view<xag_ntk, details::num_and<xag_ntk>, false> xag_new_md{ xag_md_opt };
		md_after = xag_new_md.depth();
		mc_after = mockturtle::costs<xag_ntk, details::num_and<xag_ntk>>( xag_md_opt );

        if (i == 0) {
            md_before_all = md_after;
            mc_before_all = mc_after;
            std::cout << "[i] start md, mc: " << md_before_all << "," << mc_before_all << "\n";
        }

        if (md_after < md_before_all || (md_after == md_before_all && (mc_after < mc_before_all))) {
        //if ((md_after * md_after * mc_after) < (md_before_all * md_before_all * mc_before_all)) {
            std::cout << "[i] found better circuit after " << i << " iterations\n";
            std::cout << "[i] md, mc: " << md_before_all << "," << mc_before_all << "->" << md_after << "," << mc_after << "\n";
            break;
        }

        if (i % 2 == 0) {
            mockturtle::resubstitution_params rs_ps;
            mockturtle::resubstitution_stats rs_st;
            rs_ps.max_pis = 8u;
            rs_ps.max_inserts = 1u;
            rs_ps.progress = false;
        
            mockturtle::depth_view depth_xag{ xag_md_opt };
            mockturtle::fanout_view fanout_xag{ depth_xag };
        
            uint32_t const size_before = fanout_xag.num_gates();
            xag_resubstitution( fanout_xag, rs_ps, &rs_st );
            fanout_xag.transfer_trace();
            xag_md_opt = cleanup_dangling( xag_md_opt );
        } else {
            xag_md_opt = mockturtle::balancing<xag_ntk, details::num_and<xag_ntk>>( xag_md_opt, mockturtle::esop_rebalancing<xag_ntk>{}, balance_ps );
        }
    }

    if (i != limit) {
        seqn.ntk = xag_md_opt;
    } else if (limit != 0) {
        std::cout << "[i] gave up after " << i << " iterations\n";
    }   

    write_eqn(out_path.c_str(), seqn);
}

int main(int argc, char **argv)
{
  using namespace mockturtle;
  using namespace experiments;

    opterr = 0;
    int benchmarks_mode = 0;
    int skip_opt = 0;

    int c;
    while ((c = getopt(argc,argv,"bs")) != -1) {
        switch (c) {
            case 'b': benchmarks_mode = 1; break;
            case 's': skip_opt = 1; break;
        }
    }

    if (benchmarks_mode) {
        for ( auto const& benchmark : lobster_benchmarks() )
        {
            std::string filename = fmt::format( "esop_out/{}.v", benchmark );
            std::string infile = bench_path( benchmark );
            opt_benchmark(infile, filename, 5);
        }
    } else {
        if (argc - optind < 2) {
            std::cerr << "[e] expected path to input file & output eqn path\n";
            exit(EXIT_FAILURE);
        }
        std::string in_path(argv[optind]);
        std::string out_path(argv[optind+1]);
        opt_benchmark(in_path, out_path, skip_opt ? 0 : 5);
    }
  return 0;
}