#include <vector>
#include <map>
#include <iostream>

namespace grouper {
    
    class Grouper {
    public:
        std::map<int, std::vector<long long>> find(std::vector<long long> query);
        Grouper(std::vector<std::vector<long long>> table);
        std::vector<std::vector<long long>> get_table();
        void tt();
    private:
        std::vector<std::vector<long long>> table;    
        std::map<long long, std::vector<long long>> addr_dst;

        
    //friend

    };
}
