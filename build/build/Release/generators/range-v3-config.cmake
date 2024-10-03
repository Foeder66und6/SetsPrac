########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(range-v3_FIND_QUIETLY)
    set(range-v3_MESSAGE_MODE VERBOSE)
else()
    set(range-v3_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/range-v3Targets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${range-v3_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(range-v3_VERSION_STRING "cci.20240905")
set(range-v3_INCLUDE_DIRS ${range-v3_INCLUDE_DIRS_RELEASE} )
set(range-v3_INCLUDE_DIR ${range-v3_INCLUDE_DIRS_RELEASE} )
set(range-v3_LIBRARIES ${range-v3_LIBRARIES_RELEASE} )
set(range-v3_DEFINITIONS ${range-v3_DEFINITIONS_RELEASE} )


# Only the last installed configuration BUILD_MODULES are included to avoid the collision
foreach(_BUILD_MODULE ${range-v3_BUILD_MODULES_PATHS_RELEASE} )
    message(${range-v3_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


