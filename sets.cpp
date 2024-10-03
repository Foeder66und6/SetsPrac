#include <iostream>
#include <vector>
#include <map>
#include <fstream>

#include <csv.hpp>//"csv.hpp"//

#include <rapidjson/document.h>
#include <rapidjson/filereadstream.h>
#include <cstdio>
#include "grouper.hpp"

//#include
#include <cxxopts.hpp>//

int ab;
std::vector<std::vector<long long>> table = {};
std::vector<std::vector<long long>> srcs = {};
std::vector<std::vector<long long>> dsts = {};
std::vector<std::vector<long long>> links = {};
std::vector<long long> dst_set = {};
std::vector<long long> query_dst = {};
std::map<int, long long> actual_src = {};
std::map<int, long long> actual_dst = {};
std::map<long long, std::vector<long long>> addr_dst = {};

//
//



int main(int argc, char *argv[]) {

    

    cxxopts::Options options("disjoint sets", "A program for searching disjoint sets");
    
    options.add_options()("p,path", "path to csv file", cxxopts::value<std::string>());
    options.add_options()("j,json", "path to json file", cxxopts::value<std::string>());
    options.add_options()("h,help", "print possible arguments");
    auto opt_resr = options.parse(argc, argv);
    
    std::string path;

    std::string json_path;
    long long sets_quantity;
    long long src_quantity;
    long long size_sum;
    int max_size_at;
    sets_quantity = 0;
    src_quantity = 0;
    max_size_at = 0;
    size_sum = 0;
    
    ab = 3;
    
    
    

    //retrievement of path to csv file
    if (opt_resr.count("path") > 0) {
      
      path = opt_resr["path"].as<std::string>();
      
      csv::CSVReader reader(path);
      for (csv::CSVRow& row : reader) {
          std::vector<long long> tr_row = {};
          for (csv::CSVField& field : row ) {
              tr_row.push_back(field.get<long long>());
          }
          table.push_back(tr_row);

      }
      
    }
    
    grouper::Grouper gr = {table};
    //gr.tt();
    if (opt_resr.count("json") > 0) {
        json_path = opt_resr["json"].as<std::string>();
        rapidjson::Document json_doc;
        std::FILE* in_file = fopen(json_path.c_str(), "rb");
        char read_buf[1024 * 16];
        rapidjson::FileReadStream in_stream(in_file, read_buf, sizeof(read_buf));
        json_doc.ParseStream(in_stream);
        if (json_doc.IsArray()) {
            for (int i = 0; i < int(json_doc.Size()); i++) {
                query_dst.push_back(json_doc[i].GetInt64());
            }
        }
    }
    if (opt_resr.count("help") > 0) {
        std::cout <<options.help() << std::endl;
        exit(0);
    }
    
    int n;
    
    int dst;
    int src;
    
    n = table.size();
    
    

    
    std::cout << "unions finished..." << std::endl;

    //writing to csv file
    std::ofstream output_stream;
    output_stream.open(path.substr(0, path.size() - 4) + "_result" + ".csv");
    
    auto writer = csv::make_csv_writer(output_stream);
    std::vector<std::vector<long long>> result = gr.get_table();
    writer << std::vector<std::string>({"src_id", "dst_id", "group_id"});
    for (int i = 0; i < n; i++) {
        
        writer << std::vector<long long>({result[i][0], result[i][1], result[i][2]});

    }
    output_stream.close();
    std::cout << "output is wrote to " << path.substr(0, path.size() - 4) + "_result" + ".csv" << std::endl;
    std::cout << "writing finihsed..." << std::endl;
    
    
      
   
    //src sets search queried in json file
    if (opt_resr.count("json") > 0) {
       
        
        std::map<int, std::vector<long long>> found_src = gr.find(query_dst);
        
        
        std::cout << "sets found: " << found_src.size() << std::endl;
        std::cout << "[set_id] : set_size" << std::endl;
        
        for (auto const& [set_id, set] : found_src) {
            std::cout << "[" << set_id << "] : " << set.size() << std::endl;
        }
    }
//???????????

    return 0;
}// z
 