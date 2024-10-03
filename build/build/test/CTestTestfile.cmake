# CMake generated Testfile for 
# Source directory: D:/C/PracticeLibsA/test
# Build directory: D:/C/PracticeLibsA/build/build/test
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
if(CTEST_CONFIGURATION_TYPE MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(sets_t "D:/C/PracticeLibsA/build/build/test/Debug/test_sets.exe")
  set_tests_properties(sets_t PROPERTIES  _BACKTRACE_TRIPLES "D:/C/PracticeLibsA/test/CMakeLists.txt;13;add_test;D:/C/PracticeLibsA/test/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(sets_t "D:/C/PracticeLibsA/build/build/test/Release/test_sets.exe")
  set_tests_properties(sets_t PROPERTIES  _BACKTRACE_TRIPLES "D:/C/PracticeLibsA/test/CMakeLists.txt;13;add_test;D:/C/PracticeLibsA/test/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(sets_t "D:/C/PracticeLibsA/build/build/test/MinSizeRel/test_sets.exe")
  set_tests_properties(sets_t PROPERTIES  _BACKTRACE_TRIPLES "D:/C/PracticeLibsA/test/CMakeLists.txt;13;add_test;D:/C/PracticeLibsA/test/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(sets_t "D:/C/PracticeLibsA/build/build/test/RelWithDebInfo/test_sets.exe")
  set_tests_properties(sets_t PROPERTIES  _BACKTRACE_TRIPLES "D:/C/PracticeLibsA/test/CMakeLists.txt;13;add_test;D:/C/PracticeLibsA/test/CMakeLists.txt;0;")
else()
  add_test(sets_t NOT_AVAILABLE)
endif()
