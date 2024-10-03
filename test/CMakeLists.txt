
project(testing)
enable_testing()


add_executable(test_sets test.cpp)# tr

#target_compile_definitions(test_sets PRIVATE $<TARGET_PROPERTY:grouper,COMPILE_DEFINITIONS>)


target_link_libraries(test_sets PRIVATE grouper GTest::gtest_main range-v3::range-v3)

add_test(NAME sets_t COMMAND test_sets)

