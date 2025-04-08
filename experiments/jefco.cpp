#include <experiments.hpp>
#include <lorina/verilog.hpp>
#include <mockturtle/algorithms/jefco.hpp>
#include <mockturtle/io/verilog_reader.hpp>

using namespace mockturtle;

void parse_seqn(const char *seqn_path, ParsedSeqn &ps) {
    std::ifstream seqn_f;
    seqn_f.open(seqn_path, std::ios::in);
    std::string line;
    std::unordered_map<std::string, int> sig_name_lookup;
    std::vector<mockturtle::xag_network::signal> signals;
    assert(ps.ntk.size() == 1);
    ps.node2ind.push_back(std::make_pair(0, false));
    int i = 0;
    int inps_size = 0;
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
            std::generate( signals.begin(), signals.end(), [&]() { 
                ps.node2ind.push_back(std::make_pair(ps.node2ind.size(), false));
                return ps.ntk.create_pi(); 
            } );
            inps_size = ps.node2ind.size();

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
			int old_size = ps.ntk.size();
            switch (op) {
                case 'w': {
                    assert(sig_name_lookup.find(opA) != sig_name_lookup.end());
                    sig_ind = sig_name_lookup[opA];
                    break;
                }
                case '^': {
                    assert(sig_name_lookup.find(opA) != sig_name_lookup.end());
                    assert(sig_name_lookup.find(opB) != sig_name_lookup.end());
                    mockturtle::xag_network::signal &sigA = signals[sig_name_lookup[opA]];
                    mockturtle::xag_network::signal &sigB = signals[sig_name_lookup[opB]];
                    sig_ind = signals.size();
                    signals.emplace_back(ps.ntk.create_xor( sigA, sigB ));
                    break;
                }
                case '*': {
                    assert(sig_name_lookup.find(opA) != sig_name_lookup.end());
                    assert(sig_name_lookup.find(opB) != sig_name_lookup.end());
                    mockturtle::xag_network::signal &sigA = signals[sig_name_lookup[opA]];
                    mockturtle::xag_network::signal &sigB = signals[sig_name_lookup[opB]];
                    sig_ind = signals.size();
                    signals.emplace_back( ps.ntk.create_and( sigA, sigB ) );
                    break;
                }
                case '!': {
                    assert(sig_name_lookup.find(opA) != sig_name_lookup.end());
                    mockturtle::xag_network::signal &sigA = signals[sig_name_lookup[opA]];
                    sig_ind = signals.size();
                    signals.emplace_back( ps.ntk.create_not( sigA ) );
                    assert(ps.ntk.size() == old_size);
                    break;
                }
                default: {
                    std::cerr << "[e] unrecognized seqn op " << op << std::endl;
                    break;
                }
            }
			if (ps.ntk.size() == old_size + 1) {
				auto &sig = signals.back();
				bool sig_comp = ps.ntk.is_complemented(sig);
				ps.node2ind.push_back(std::make_pair(i - 2 + inps_size, sig_comp));
			} else {
				assert(ps.ntk.size() == old_size);
			}
            sig_name_lookup[out] = sig_ind;
        }
         
        i++;
    }

	if (ps.node2ind.size() != ps.ntk.size()) {
		std::cerr << ps.node2ind.size() << std::endl;
		std::cerr << "bad path: " << seqn_path << std::endl;
	}
    assert(ps.node2ind.size() == ps.ntk.size());
	// take 1 away for input line, 1 away for output
	// add number of inputs (true/false included)
	std::cerr << "ind2eclass.size() = " << i - 2 + inps_size << "\n"; 
    for (auto &po : ps.outnodes) {
        assert(sig_name_lookup.find(po) != sig_name_lookup.end());
        ps.ntk.create_po(signals[sig_name_lookup[po]]);
    }
}


int main(int argc, char **argv)
{
	using namespace experiments;

	if (argc != 3) {
		std::cerr << "[e] expected path to input seqn & output rules\n";
		exit(EXIT_FAILURE);
	}
	const char* seqn_path  = argv[1];
	const char* rules_path = argv[2];

	ParsedSeqn seqn;
	parse_seqn(seqn_path, seqn);

	fmt::print( "[i] processing {}\n", seqn_path );

	jefco_params ps{};
	ps.cut_enum_ps.cut_size = 5u;
	ps.cut_enum_ps.cut_limit = 25u; // limitations on amount of cuts enumerated at each root
	ps.cut_enum_ps.verbose = false;
	ps.cut_enum_ps.very_verbose = false;
	ps.esop_only_on_critical_path = true; // generate an ESOP implementation for a cut only if its root node is on the MD critial path
	ps.progress = false;
	ps.verbose = false;
	ps.very_verbose = false;

	jefco_stats st{};

	jefco( seqn, rules_path, ps, &st );

	return 0;
}