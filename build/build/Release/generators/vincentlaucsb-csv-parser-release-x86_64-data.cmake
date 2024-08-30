########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(vincentlaucsb-csv-parser_COMPONENT_NAMES "")
if(DEFINED vincentlaucsb-csv-parser_FIND_DEPENDENCY_NAMES)
  list(APPEND vincentlaucsb-csv-parser_FIND_DEPENDENCY_NAMES )
  list(REMOVE_DUPLICATES vincentlaucsb-csv-parser_FIND_DEPENDENCY_NAMES)
else()
  set(vincentlaucsb-csv-parser_FIND_DEPENDENCY_NAMES )
endif()

########### VARIABLES #######################################################################
#############################################################################################
set(vincentlaucsb-csv-parser_PACKAGE_FOLDER_RELEASE "C:/Users/User/.conan2/p/vince5ff4427730244/p")
set(vincentlaucsb-csv-parser_BUILD_MODULES_PATHS_RELEASE )


set(vincentlaucsb-csv-parser_INCLUDE_DIRS_RELEASE "${vincentlaucsb-csv-parser_PACKAGE_FOLDER_RELEASE}/include")
set(vincentlaucsb-csv-parser_RES_DIRS_RELEASE )
set(vincentlaucsb-csv-parser_DEFINITIONS_RELEASE )
set(vincentlaucsb-csv-parser_SHARED_LINK_FLAGS_RELEASE )
set(vincentlaucsb-csv-parser_EXE_LINK_FLAGS_RELEASE )
set(vincentlaucsb-csv-parser_OBJECTS_RELEASE )
set(vincentlaucsb-csv-parser_COMPILE_DEFINITIONS_RELEASE )
set(vincentlaucsb-csv-parser_COMPILE_OPTIONS_C_RELEASE )
set(vincentlaucsb-csv-parser_COMPILE_OPTIONS_CXX_RELEASE )
set(vincentlaucsb-csv-parser_LIB_DIRS_RELEASE )
set(vincentlaucsb-csv-parser_BIN_DIRS_RELEASE )
set(vincentlaucsb-csv-parser_LIBRARY_TYPE_RELEASE UNKNOWN)
set(vincentlaucsb-csv-parser_IS_HOST_WINDOWS_RELEASE 1)
set(vincentlaucsb-csv-parser_LIBS_RELEASE )
set(vincentlaucsb-csv-parser_SYSTEM_LIBS_RELEASE )
set(vincentlaucsb-csv-parser_FRAMEWORK_DIRS_RELEASE )
set(vincentlaucsb-csv-parser_FRAMEWORKS_RELEASE )
set(vincentlaucsb-csv-parser_BUILD_DIRS_RELEASE )
set(vincentlaucsb-csv-parser_NO_SONAME_MODE_RELEASE FALSE)


# COMPOUND VARIABLES
set(vincentlaucsb-csv-parser_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${vincentlaucsb-csv-parser_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${vincentlaucsb-csv-parser_COMPILE_OPTIONS_C_RELEASE}>")
set(vincentlaucsb-csv-parser_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${vincentlaucsb-csv-parser_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${vincentlaucsb-csv-parser_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${vincentlaucsb-csv-parser_EXE_LINK_FLAGS_RELEASE}>")


set(vincentlaucsb-csv-parser_COMPONENTS_RELEASE )