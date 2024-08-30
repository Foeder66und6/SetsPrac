cmake_minimum_required(VERSION 3.5.0)
project(Sets VERSION 0.1.0 LANGUAGES C CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

find_package(lazycsv REQUIRED)# REqu  куКУКУУКУККУКУУКУКУУККУУККУУККУУККУУККУУККУУККУУК gsg REquofew
find_package(vincentlaucsb-csv-parser REQUIRED)
find_package(cxxopts REQUIRED)
find_package(RapidJSON REQUIRED)#find_package(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE) find_package(RA rg rereererreerreerrereererreerreerreerreerrereererreerreerrereerer)
find_package(GTest REQUIRED)#find+package(GTest REQUIRED) v vincentlaucsb-csv-parset



#№#..КП ДТУКЦ КХЖДУЦ ЖДЬК 
#reNREL;R G  R'
#lazycsv/cci.20221117 \
#*№ сччщзеы.3ю2ю0
#
#compiler.runtime=dynamic
#vincentlaucsb-csv-patser

add_executable(${PROJECT_NAME} sets.cpp)

target_link_libraries(${PROJECT_NAME} vincentlaucsb-csv-parser::vincentlaucsb-csv-parser)
target_link_libraries(${PROJECT_NAME} lazycsv::lazycsv)
target_link_libraries(${PROJECT_NAME} cxxopts::cxxopts)
target_link_libraries(${PROJECT_NAME} rapidjson)
target_link_libraries(${PROJECT_NAME} gtest::gtest)#target+link_libtaries(${PROJECT_NAME}(am) gtest::gtest) (it was returned and continued where actualmark(am) in actual thing was done till the end)

#add_executable(${PROJECT_NAME} sets.cpp)#add_execi  ererw 3 rereererrereererreerreerreerer r eererrereerre reerreerreerreer rereererrereererreerreerreerreerrereererrereerer#add_executablee