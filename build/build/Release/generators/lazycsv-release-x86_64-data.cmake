########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(lazycsv_COMPONENT_NAMES "")
if(DEFINED lazycsv_FIND_DEPENDENCY_NAMES)
  list(APPEND lazycsv_FIND_DEPENDENCY_NAMES )
  list(REMOVE_DUPLICATES lazycsv_FIND_DEPENDENCY_NAMES)
else()
  set(lazycsv_FIND_DEPENDENCY_NAMES )
endif()

########### VARIABLES #######################################################################
#############################################################################################
set(lazycsv_PACKAGE_FOLDER_RELEASE "C:/Users/User/.conan2/p/lazyce8d1514a7e2a9/p")
set(lazycsv_BUILD_MODULES_PATHS_RELEASE )


set(lazycsv_INCLUDE_DIRS_RELEASE "${lazycsv_PACKAGE_FOLDER_RELEASE}/include")
set(lazycsv_RES_DIRS_RELEASE )
set(lazycsv_DEFINITIONS_RELEASE )
set(lazycsv_SHARED_LINK_FLAGS_RELEASE )
set(lazycsv_EXE_LINK_FLAGS_RELEASE )
set(lazycsv_OBJECTS_RELEASE )
set(lazycsv_COMPILE_DEFINITIONS_RELEASE )
set(lazycsv_COMPILE_OPTIONS_C_RELEASE )
set(lazycsv_COMPILE_OPTIONS_CXX_RELEASE )
set(lazycsv_LIB_DIRS_RELEASE )
set(lazycsv_BIN_DIRS_RELEASE )
set(lazycsv_LIBRARY_TYPE_RELEASE UNKNOWN)
set(lazycsv_IS_HOST_WINDOWS_RELEASE 1)
set(lazycsv_LIBS_RELEASE )
set(lazycsv_SYSTEM_LIBS_RELEASE )
set(lazycsv_FRAMEWORK_DIRS_RELEASE )
set(lazycsv_FRAMEWORKS_RELEASE )
set(lazycsv_BUILD_DIRS_RELEASE )
set(lazycsv_NO_SONAME_MODE_RELEASE FALSE)


# COMPOUND VARIABLES
set(lazycsv_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${lazycsv_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${lazycsv_COMPILE_OPTIONS_C_RELEASE}>")
set(lazycsv_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${lazycsv_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${lazycsv_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${lazycsv_EXE_LINK_FLAGS_RELEASE}>")


set(lazycsv_COMPONENTS_RELEASE )