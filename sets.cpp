#include <iostream>
#include <vector>
#include <map>
#include <fstream>

#include "csv.hpp"
#include "rapidjson/document.h"
#include "rapidjson/filereadstream.h"
#include <cstdio>

//#include
#include <cxxopts.hpp>//

int ab;
std::vector<std::vector<long long>> table = {};
std::vector<std::vector<long long>> srcs = {};
std::vector<std::vector<long long>> dsts = {};
std::vector<std::vector<long long>> links = {};
std::vector<long long> query_dst = {};
std::map<int, long long> actual_src = {};
std::map<int, long long> actual_dst = {};

std::map<long long, long long> find(std::vector<long long> query) {
    std::map<long long, std::vector<long long>> indexes;
    std::map<long long, long long> result = {};
    
    for (int i = 0; i < query.size(); i++ ) {
        std::vector<long long> dst = {};
        dst = dsts[actual_dst[query[i]]];
        int link = dst[dst.size() - 1];
        if (result.find(link) != result.end()) {
            continue;
        }
        
        result[link] = srcs[links[link][0]].size() - 1;
        
    }
    
    return result;
}


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
    //retrievement of path to json file
    if (opt_resr.count("json") > 0) {
        json_path = opt_resr["json"].as<std::string>();
        rapidjson::Document json_doc;
        std::FILE* in_file = fopen(json_path.c_str(), "rb");
        char read_buf[1024 * 16];
        rapidjson::FileReadStream in_stream(in_file, read_buf, sizeof(read_buf));
        json_doc.ParseStream(in_stream);
        if (json_doc.IsArray()) {
            for (int i = 0; i < json_doc.Size(); i++) {
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
    
    for (int i = 0; i < n; i++) {
        std::vector<long long> src_set;
        std::vector<long long> dst_set;
        
        src = table[i][0];
        dst = table[i][1];

        
        //new set creation
        if (actual_src.find(src) == actual_src.end() && actual_dst.find(dst) == actual_dst.end()) {
            
            src_set = {src, (long long) links.size()};
            dst_set = {dst, (long long) links.size()};
            actual_src[src] = srcs.size();
            actual_dst[dst] = dsts.size();
            links.push_back({(long long) srcs.size(), (long long) dsts.size()});
            srcs.push_back(src_set);
            dsts.push_back(dst_set);
        }
        //sets union
        int link;
        int link_f; 
        if (actual_src.find(src) != actual_src.end() && actual_dst.find(dst) != actual_dst.end()) {
            
            src_set = srcs[actual_src[src]];
            dst_set = dsts[actual_dst[dst]];
            if (src_set[src_set.size() - 1] != dst_set[dst_set.size() - 1]) {
            
                std::vector<long long> first_set;
                std::vector<long long> second_set;
                std::vector<long long> new_link = {};

                //src union
                first_set = srcs[actual_src[src]];
                second_set = srcs[links[dst_set[dst_set.size() - 1]][0]];
                link_f = actual_src[src];
                link = links[dst_set[dst_set.size() - 1]][0];
                if (first_set.size() > second_set.size()) {
                    first_set = srcs[links[dst_set[dst_set.size() - 1 ]][0]];
                    second_set =  srcs[actual_src[src]];
                    link_f = links[dst_set[dst_set.size() - 1]][0];
                    link = actual_src[src];
                }
                second_set.pop_back();
                for (int i = 0; i < first_set.size() - 1; i++) {
                    second_set.push_back(first_set[i]);
                    actual_src[first_set[i]] = link;
                }
                first_set.push_back(-1);
                second_set.push_back((long long) links.size());
                new_link.push_back(link);
                srcs[link] = second_set;
                srcs[link_f] = first_set;

                //dst union
                first_set = dsts[actual_dst[dst]];
                second_set = dsts[links[src_set[src_set.size() - 1]][1]];
                link_f = actual_dst[dst];
                link = links[src_set[src_set.size() - 1]][1];
                if (first_set.size() >= second_set.size()) {
                    first_set = dsts[links[src_set[src_set.size() - 1]][1]];
                    second_set = dsts[actual_dst[dst]];
                    link_f = links[src_set[src_set.size() - 1]][1];
                    link = actual_dst[dst];
                }
                second_set.pop_back();
                for (int i = 0; i < first_set.size() - 1; i++) {
                    second_set.push_back(first_set[i]);
                    actual_dst[first_set[i]] = link;
                }
                first_set.push_back(-1);
                second_set.push_back((long long) links.size());
                new_link.push_back(link);
                dsts[link] = second_set;
                dsts[link_f] = first_set;

                links.push_back(new_link);;
                
                


            }
        } else {
            
            //single element addition
            if (actual_src.find(src) == actual_src.end()) {
                dst_set = dsts[actual_dst[dst]];
                link = links[dst_set[dst_set.size() - 1]][0];
                src_set = srcs[link];
                actual_src[src] = link;
                link = src_set[src_set.size() - 1];
                src_set[src_set.size() - 1] = src;
                src_set.push_back(link);
                srcs[actual_src[src]] = src_set;
            }
            if (actual_dst.find(dst) == actual_dst.end()) {
                src_set = srcs[actual_src[src]];
                link = links[src_set[src_set.size() - 1]][1];
                dst_set = dsts[link];
                actual_dst[dst] = link;
                link = dst_set[dst_set.size() - 1];
                dst_set[dst_set.size() - 1] = dst;
                dst_set.push_back(link);
                dsts[actual_dst[dst]] = dst_set;
            }
        }



        
    }
    
    

    
    std::cout << "unions finished..." << std::endl;

    //writing to csv file
    std::ofstream output_stream;
    output_stream.open(path.substr(0, path.size() - 4) + "_result" + ".csv");
    
    auto writer = csv::make_csv_writer(output_stream);
    writer << std::vector<std::string>({"src_id", "dst_id", "group_id"});
    for (int i = 0; i < n; i++) {
        std::vector<long long> tr_set = dsts[actual_dst[table[i][1]]];
        table[i].push_back(tr_set[tr_set.size() - 1]);
        writer << std::vector<long long>({table[i][0], table[i][1], table[i][2]});

    }
    output_stream.close();
    std::cout << "output is wrote to " << path.substr(0, path.size() - 4) + "_result" + ".csv" << std::endl;
    std::cout << "writing finihsed..." << std::endl;
    
    
      
   
    //src sets search queried in json file
    if (opt_resr.count("json") > 0) {
       
        std::map<long long, long long> found_src = {};
        found_src = find(query_dst);
        std::cout << "sets found: " << found_src.size() << std::endl;
        std::cout << "[set_id] : set_size" << std::endl;
        
        for (auto const& [set_id, set_size] : found_src) {
            std::cout << "[" << set_id << "] : " << set_size << std::endl;
        }
    }
   //calculating mean set size, src quantity, sets quantity  
   src_quantity = actual_src.size();
   for (int i = 0; i < links.size(); i++) {
        
        
        std::vector<long long> dst_set = {};
        std::vector<long long> src_set = {};
        dst_set = dsts[links[i][1]];
        src_set = srcs[links[i][0]];
        
        if (src_set[src_set.size() - 1] == i) {
            
            sets_quantity++;
            if (srcs[max_size_at].size() < src_set.size()) {
                max_size_at = links[i][0];
            }
            size_sum += src_set.size() - 1;
        }
    }
    std::cout << "sets found: " << sets_quantity << std::endl;
    std::cout << "srcs found: " << src_quantity << std::endl;
    std::cout << "mean set size: " << float (float(size_sum) / float(sets_quantity)) << std::endl;
    return 0;
}// z
