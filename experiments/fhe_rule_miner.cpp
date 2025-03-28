#include <experiments.hpp>
#include <lorina/verilog.hpp>
#include <mockturtle/algorithms/fhe_rule_miner.hpp>
#include <mockturtle/io/verilog_reader.hpp>

//std::string bench_path( std::string const& benchmark_name )
//{
//  return fmt::format( "{}BEST_RESULTS/EPFL/{}.v", EXPERIMENTS_PATH, benchmark_name );
//}
std::string bench_path( std::string const& benchmark_name )
{
  return fmt::format( "{}lobster_v/{}.v", EXPERIMENTS_PATH, benchmark_name );
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

int main()
{
  using namespace mockturtle;
  using namespace experiments;

  for ( auto const& benchmark : lobster_benchmarks() )
  {
    xag_network ntk;
    if ( lorina::read_verilog( bench_path( benchmark ), verilog_reader( ntk ) ) != lorina::return_code::success )
    {
      continue;
    }
    fmt::print( "[i] processing {}\n", benchmark );

    fhe_rule_miner_params ps{};
    ps.cut_enum_ps.cut_size = 5u;
    ps.cut_enum_ps.cut_limit = 25u; // limitations on amount of cuts enumerated at each root
    ps.cut_enum_ps.verbose = false;
    ps.cut_enum_ps.very_verbose = false;
    ps.num_rules_limit = 500u;    // limitations on total amount of mined rules
    ps.num_node_rules_limit = 2u; // limitation on amount of rules mined at each root
    ps.progress = true;
    ps.verbose = true;
    ps.very_verbose = false;

    fhe_rule_miner_stats st{};

    std::string dbname = "db_fhe_5";
    //std::string dbname = "db_esop_new";
    std::string filename = fmt::format( "fhe_rules/{}", benchmark );

    fhe_rule_miner( ntk, dbname, filename, ps, &st );
  }

  return 0;
}