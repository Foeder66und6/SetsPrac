# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(vincentlaucsb-csv-parser_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(vincentlaucsb-csv-parser_FRAMEWORKS_FOUND_RELEASE "${vincentlaucsb-csv-parser_FRAMEWORKS_RELEASE}" "${vincentlaucsb-csv-parser_FRAMEWORK_DIRS_RELEASE}")

set(vincentlaucsb-csv-parser_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET vincentlaucsb-csv-parser_DEPS_TARGET)
    add_library(vincentlaucsb-csv-parser_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET vincentlaucsb-csv-parser_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${vincentlaucsb-csv-parser_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${vincentlaucsb-csv-parser_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### vincentlaucsb-csv-parser_DEPS_TARGET to all of them
conan_package_library_targets("${vincentlaucsb-csv-parser_LIBS_RELEASE}"    # libraries
                              "${vincentlaucsb-csv-parser_LIB_DIRS_RELEASE}" # package_libdir
                              "${vincentlaucsb-csv-parser_BIN_DIRS_RELEASE}" # package_bindir
                              "${vincentlaucsb-csv-parser_LIBRARY_TYPE_RELEASE}"
                              "${vincentlaucsb-csv-parser_IS_HOST_WINDOWS_RELEASE}"
                              vincentlaucsb-csv-parser_DEPS_TARGET
                              vincentlaucsb-csv-parser_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "vincentlaucsb-csv-parser"    # package_name
                              "${vincentlaucsb-csv-parser_NO_SONAME_MODE_RELEASE}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${vincentlaucsb-csv-parser_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET vincentlaucsb-csv-parser::vincentlaucsb-csv-parser
                 APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${vincentlaucsb-csv-parser_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${vincentlaucsb-csv-parser_LIBRARIES_TARGETS}>
                 )

    if("${vincentlaucsb-csv-parser_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET vincentlaucsb-csv-parser::vincentlaucsb-csv-parser
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     vincentlaucsb-csv-parser_DEPS_TARGET)
    endif()

    set_property(TARGET vincentlaucsb-csv-parser::vincentlaucsb-csv-parser
                 APPEND PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${vincentlaucsb-csv-parser_LINKER_FLAGS_RELEASE}>)
    set_property(TARGET vincentlaucsb-csv-parser::vincentlaucsb-csv-parser
                 APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${vincentlaucsb-csv-parser_INCLUDE_DIRS_RELEASE}>)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET vincentlaucsb-csv-parser::vincentlaucsb-csv-parser
                 APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Release>:${vincentlaucsb-csv-parser_LIB_DIRS_RELEASE}>)
    set_property(TARGET vincentlaucsb-csv-parser::vincentlaucsb-csv-parser
                 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${vincentlaucsb-csv-parser_COMPILE_DEFINITIONS_RELEASE}>)
    set_property(TARGET vincentlaucsb-csv-parser::vincentlaucsb-csv-parser
                 APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${vincentlaucsb-csv-parser_COMPILE_OPTIONS_RELEASE}>)

########## For the modules (FindXXX)
set(vincentlaucsb-csv-parser_LIBRARIES_RELEASE vincentlaucsb-csv-parser::vincentlaucsb-csv-parser)
