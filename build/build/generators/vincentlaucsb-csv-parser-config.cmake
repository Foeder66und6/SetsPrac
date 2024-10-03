########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(vincentlaucsb-csv-parser_FIND_QUIETLY)
    set(vincentlaucsb-csv-parser_MESSAGE_MODE VERBOSE)
else()
    set(vincentlaucsb-csv-parser_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/vincentlaucsb-csv-parserTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${vincentlaucsb-csv-parser_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(vincentlaucsb-csv-parser_VERSION_STRING "2.2.0")
set(vincentlaucsb-csv-parser_INCLUDE_DIRS ${vincentlaucsb-csv-parser_INCLUDE_DIRS_RELEASE} )
set(vincentlaucsb-csv-parser_INCLUDE_DIR ${vincentlaucsb-csv-parser_INCLUDE_DIRS_RELEASE} )
set(vincentlaucsb-csv-parser_LIBRARIES ${vincentlaucsb-csv-parser_LIBRARIES_RELEASE} )
set(vincentlaucsb-csv-parser_DEFINITIONS ${vincentlaucsb-csv-parser_DEFINITIONS_RELEASE} )


# Only the last installed configuration BUILD_MODULES are included to avoid the collision
foreach(_BUILD_MODULE ${vincentlaucsb-csv-parser_BUILD_MODULES_PATHS_RELEASE} )
    message(${vincentlaucsb-csv-parser_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


