message(STATUS "Conan: Using CMakeDeps conandeps_legacy.cmake aggregator via include()")
message(STATUS "Conan: It is recommended to use explicit find_package() per dependency instead")

find_package(vincentlaucsb-csv-parser)
find_package(lazycsv)
find_package(cxxopts)
find_package(RapidJSON)
find_package(GTest)

set(CONANDEPS_LEGACY  vincentlaucsb-csv-parser::vincentlaucsb-csv-parser  lazycsv::lazycsv  cxxopts::cxxopts  rapidjson  gtest::gtest )