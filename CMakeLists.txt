cmake_minimum_required(VERSION 3.5.0)
project(Sets VERSION 0.1.0 LANGUAGES C CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

find_package(lazycsv REQUIRED)
find_package(vincentlaucsb-csv-parser REQUIRED)
find_package(cxxopts REQUIRED)
find_package(RapidJSON REQUIRED)
find_package(GTest REQUIRED)



add_executable(${PROJECT_NAME} sets.cpp)

target_link_libraries(${PROJECT_NAME} vincentlaucsb-csv-parser::vincentlaucsb-csv-parser)
target_link_libraries(${PROJECT_NAME} lazycsv::lazycsv)
target_link_libraries(${PROJECT_NAME} cxxopts::cxxopts)
target_link_libraries(${PROJECT_NAME} rapidjson)
target_link_libraries(${PROJECT_NAME} gtest::gtest)

#add_executable(${PROJECT_NAME} sets.cpp)
