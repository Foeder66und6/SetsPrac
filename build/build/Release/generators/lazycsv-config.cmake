########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(lazycsv_FIND_QUIETLY)
    set(lazycsv_MESSAGE_MODE VERBOSE)
else()
    set(lazycsv_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/lazycsvTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${lazycsv_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(lazycsv_VERSION_STRING "cci.20221117")
set(lazycsv_INCLUDE_DIRS ${lazycsv_INCLUDE_DIRS_RELEASE} )
set(lazycsv_INCLUDE_DIR ${lazycsv_INCLUDE_DIRS_RELEASE} )
set(lazycsv_LIBRARIES ${lazycsv_LIBRARIES_RELEASE} )
set(lazycsv_DEFINITIONS ${lazycsv_DEFINITIONS_RELEASE} )


# Only the last installed configuration BUILD_MODULES are included to avoid the collision
foreach(_BUILD_MODULE ${lazycsv_BUILD_MODULES_PATHS_RELEASE} )
    message(${lazycsv_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


