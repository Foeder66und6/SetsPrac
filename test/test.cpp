#include <gtest/gtest.h>
//#include <fmt/core.h>
//#include "grouping.hpp"
#include "../locall/grouper.hpp"
//#include <range/v3/all.hpp>
#include <map>
#include <vector    >
#include <algorithm>

int main(int argc, char *argv[]) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}

class GroupingTest : public testing::Test {
    protected:
        GroupingTest() {}
        ~GroupingTest() override {}

        grouper::Grouper grouping{//Grouping Grouper::
            {
                {11, 21},
                {11, 22},
                {12, 22},
                {12, 23},
                {13, 23},
                {13, 24}
            }
        };

        bool compare(std::map<int, std::vector<long long>> &result, std::map<int, std::vector<long long>> expected) {

            /*
            fmt::print("result:\n");
            for (auto &&[group_id, list] : result) {
                fmt::print("\t{}:\n", group_id);
                for (auto &file_id : list) {
                    fmt::print("\t\t{}\n", file_id);
                }
            }
            */
            if (result.size() != expected.size()) return false;

            //before compare sort find by keys and assign new key values for ascending groups
            int new_group_id = 0;
            std::map<int, std::vector<long long>> result_;
            /*
            auto keys = result | ranges::views::keys
                 | ranges::views::transform([](auto &&v){return v;})
                 | ranges::to<std::vector>()

                 | ranges::actions::sort;
            */
            std::vector<std::vector<long long>> sets = {};
            for (auto& [id, set] : result) {// const
                std::sort(set.begin(), set.end());
                sets.push_back(set);
            }
            std::sort(sets.begin(), sets.end());



                
                
                
            for(int i = 0; i < sets.size(); i++) {//auto group_id : keys
                result_[++new_group_id] = std::move(sets[i]);//result[group_id]
            }
//
            for (auto &[group_id, expected_list] : expected) {
                if (result_.count(group_id) == 0) return false;
                auto found_list = result_[group_id];
                if (!expected_list.size() == found_list.size()) return false;
                std::sort(expected_list.begin(), expected_list.end());//
                std::sort(found_list.begin(), found_list.end());//
                if (!std::equal(found_list.begin(), found_list.end(), expected_list.begin())) return false;
            }
            return true;
        }
};

TEST_F(GroupingTest, group_1) {
    auto result = grouping.find({21});
    ASSERT_EQ(
        compare(
            result,
            {
                {1, {11}}
            }
        ),
        true//false
    );
}

TEST_F(GroupingTest, group_2) {
    auto result = grouping.find({22});
    ASSERT_EQ(
        compare(
            result,
            {
                {1, {11, 12}}
            }
        ),
        true
    );
}

TEST_F(GroupingTest, group_3) {
    auto result = grouping.find({21, 24});
    ASSERT_EQ(
        compare(
            result,
            {
                {1, {11}},
                {2, {13}}
            }
        ),
        true
    );
}

TEST_F(GroupingTest, group_4) {
    auto result = grouping.find({22, 23});
    ASSERT_EQ(
        compare(
            result,
            {
                {1, {11, 12, 13}}
    }
        ),
        true
    );
}

TEST_F(GroupingTest, group_5) {
    auto result = grouping.find({21, 22, 23, 24});
    ASSERT_EQ(
        compare(
            result,
            {
                {1, {11, 12, 13}}
            }
        ),
        true
    );
}

TEST_F(GroupingTest, group_6) {
    auto result = grouping.find({24});
    ASSERT_EQ(
        compare(
            result,
            {
                {1, {13}}
            }
        ),
        true
    );
}

TEST_F(GroupingTest, group_7) {
    auto result = grouping.find({23, 24});
    ASSERT_EQ(
        compare(
            result,
            {
                {1, {12, 13}}
            }
        ),
        true
    );
}
