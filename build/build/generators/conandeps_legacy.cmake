message(STATUS "Conan: Using CMakeDeps conandeps_legacy.cmake aggregator via include()")
message(STATUS "Conan: It is recommended to use explicit find_package() per dependency instead")

find_package(GTest)
find_package(range-v3)
find_package(vincentlaucsb-csv-parser)
find_package(cxxopts)
find_package(RapidJSON)

set(CONANDEPS_LEGACY  gtest::gtest  range-v3::range-v3  vincentlaucsb-csv-parser::vincentlaucsb-csv-parser  cxxopts::cxxopts  rapidjson )