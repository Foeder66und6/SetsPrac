
cmake_minimum_required(VERSION 3.5.0)#

project(Sets VERSION 0.1.0 LANGUAGES C CXX)

#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Wshadow -Wnon-virtual-dtor -pedantic -Wno-unused-parameter" )# -pedantiv  -Who-unused-parameter  -03
#find_program(CMAKE_CXX_CPPCHECK NAMES cppcheck)
#list(APPEND CMAKE_CXX_CPPCHECK "--enable=all" "--suppressions-list=${PROJECT_SOURCE_DIR}/CppChecks.txt" "--error-exitcode=0" "-rp=${PROJECT_SOURCE_DIR}")#//% PROJECT_ PROJECT_SOURCE_Dir



enable_testing()

set(cnfg build/build/generators)
set(vincentlaucsb-csv-parser_DIR  ${cnfg})
set(cxxopts_DIR ${cnfg})
set(RapidJSON_DIR ${cnfg})
set(GTest_DIR ${cnfg})
find_package(vincentlaucsb-csv-parser REQUIRED)
find_package(cxxopts REQUIRED)
find_package(RapidJSON REQUIRED)
find_package(GTest REQUIRED)
find_package(range-v3 REQUIRED)
#add_library(grouper STATIC grouper.cpp)#// .
add_subdirectory(locall)
add_subdirectory(test )








add_executable(${PROJECT_NAME} sets.cpp)

target_link_libraries(${PROJECT_NAME} vincentlaucsb-csv-parser::vincentlaucsb-csv-parser)
#target_link_libraries(${PROJECT_NAME} lazycsv::lazycsv)
target_link_libraries(${PROJECT_NAME} cxxopts::cxxopts)
target_link_libraries(${PROJECT_NAME} rapidjson)
target_link_libraries(${PROJECT_NAME} gtest::gtest)
target_link_libraries(${PROJECT_NAME} range-v3::range-v3)
target_link_libraries(${PROJECT_NAME} grouper)

include_directories(locall)


















