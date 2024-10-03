#include <iostream>
#include <vector>
#include <map>
#include "grouper.hpp"


//#using namespace grouper
namespace grouper {
    
}
using namespace grouper;
void Grouper::tt() {
    std::cout << "quite cool text" << std::endl;
}
std::map<int, std::vector<long long>> Grouper::find(std::vector<long long> query) {
    
    std::map<long long, std::vector<long long>> indexes;
    

    std::map<int, std::vector<long long>> result = {};
    std::map<int, std::vector<long long>> sets = {};
    std::map<int, long long> actual_in_src = {};

    int cur_id;
    cur_id = 0;
    
    for (long i = 0; i < query.size(); i++) {


        int cur_set;
        cur_set = -1;
        std::vector<int> t_union = {};
        std::vector<long long> srcs = addr_dst[query[i]];// dsts dst_set[i]
        //intersection search
        for (int j = 0; j < srcs.size(); j++) {
            //std::cout << srcs[j] << " " << i ;
            //std::cout << std::endl;
            if (actual_in_src.find(srcs[j]) != actual_in_src.end()) {
                t_union.push_back(srcs[j]);
                cur_set = 0;
            }
            
/**/
        }
        //new set creation
        if (cur_set == -1) {
            sets[cur_id] = {};
            
            for (int j = 0; j < srcs.size(); j++) {
                sets[cur_id].push_back(srcs[j]);
                actual_in_src[srcs[j]] = cur_id;
            }
            cur_id++;
        } else {// ()
            //set union
            int t_witch;
            std::vector<long long> first_set = sets[actual_in_src[t_union[0]]];
            t_witch = actual_in_src[t_union[0]];
            for (int j = 1; j < t_union.size(); j++) {
                int f_witch;
                f_witch = actual_in_src[t_union[j]];
                //std::cout << j << " " << f_witch << " _ " << t_witch  << std::endl;
                if (f_witch == t_witch) {
                    continue;
                }
                if (sets[f_witch].size() > sets[t_witch].size()) {
                    int tr = f_witch;
                    f_witch = t_witch;
                    t_witch = tr;//1
                }
                
                for (int k = 0; k < sets[f_witch].size(); k++ ) {
                    //std::cout << j << " " << f_witch << " - " << t_witch << std::endl;
                    sets[t_witch].push_back(sets[f_witch][k]);
                    actual_in_src[sets[f_witch][k]] = t_witch;
                    
                }
                sets[f_witch].push_back(-1);
                
            }
            for (int j = 0; j < srcs.size(); j++) {
                if (actual_in_src.find(srcs[j]) == actual_in_src.end()) {
                    sets[t_witch].push_back(srcs[j]);
                    actual_in_src[srcs[j]] = t_witch;
                }
            }
            
        }
        
    }

    for (auto& [set_id, set] : sets) {
        //std::cout << set_id << set.size();
        if (set[set.size() - 1] != -1) {
                    
            result[set_id] = set;
        }
    }
    //
    return result;
    
    }
    /**/
    Grouper::Grouper(std::vector<std::vector<long long>> table) {
    //std::cout << "Grouper class instance has been created!" << std::endl;


    std::vector<std::vector<long long>> srcs = {};
    std::vector<std::vector<long long>> dsts = {};
    std::vector<std::vector<long long>> links = {};
    std::map<int, long long> actual_src = {};
    std::map<int, long long> actual_dst = {};


    long long sets_quantity;
    long long src_quantity;
    long long size_sum;
    int max_size_at;
    sets_quantity = 0;
    src_quantity = 0;
    max_size_at = 0;
    size_sum = 0;

    
    int n;
    int dst;
    int src;
    
    n = table.size();
    addr_dst = {};
    for (int i = 0; i < n; i++) {
        std::vector<long long> src_set;
        std::vector<long long> dst_set;
        
        src = table[i][0];
        dst = table[i][1];
     

        if (addr_dst.find(dst) == addr_dst.end()) {//fi
            addr_dst[dst] = {};
            addr_dst[dst].push_back(src);
            dst_set.push_back(dst);
        } else {
            addr_dst[dst].push_back(src);
        }


        
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
                for (long j = 0; j < long(first_set.size() - 1); j++) {
                    second_set.push_back(first_set[j]);
                    actual_src[first_set[j]] = link;
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
                for (long j = 0; j < long(first_set.size() - 1); j++) {
                    second_set.push_back(first_set[j]);
                    actual_dst[first_set[j]] = link;
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
    this->table = {};
    for (int i = 0; i < n; i++) {
        std::vector<long long> tr_set = srcs[actual_src[table[i][0]]];
        this->table.push_back({table[i][0], table[i][1], tr_set[tr_set.size() - 1]});
    }

     //calculating mean set size, src quantity, sets quantity  
   src_quantity = actual_src.size();
   for (long i = 0; i < long(links.size()); i++) {
        
        
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

    
    }
    
    std::vector<std::vector<long long>> Grouper::get_table() {//0
    return table;
    }


    
    
    
