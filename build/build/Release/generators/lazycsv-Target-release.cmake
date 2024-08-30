# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(lazycsv_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(lazycsv_FRAMEWORKS_FOUND_RELEASE "${lazycsv_FRAMEWORKS_RELEASE}" "${lazycsv_FRAMEWORK_DIRS_RELEASE}")

set(lazycsv_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET lazycsv_DEPS_TARGET)
    add_library(lazycsv_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET lazycsv_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${lazycsv_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${lazycsv_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### lazycsv_DEPS_TARGET to all of them
conan_package_library_targets("${lazycsv_LIBS_RELEASE}"    # libraries
                              "${lazycsv_LIB_DIRS_RELEASE}" # package_libdir
                              "${lazycsv_BIN_DIRS_RELEASE}" # package_bindir
                              "${lazycsv_LIBRARY_TYPE_RELEASE}"
                              "${lazycsv_IS_HOST_WINDOWS_RELEASE}"
                              lazycsv_DEPS_TARGET
                              lazycsv_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "lazycsv"    # package_name
                              "${lazycsv_NO_SONAME_MODE_RELEASE}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${lazycsv_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET lazycsv::lazycsv
                 APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${lazycsv_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${lazycsv_LIBRARIES_TARGETS}>
                 )

    if("${lazycsv_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET lazycsv::lazycsv
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     lazycsv_DEPS_TARGET)
    endif()

    set_property(TARGET lazycsv::lazycsv
                 APPEND PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${lazycsv_LINKER_FLAGS_RELEASE}>)
    set_property(TARGET lazycsv::lazycsv
                 APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${lazycsv_INCLUDE_DIRS_RELEASE}>)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET lazycsv::lazycsv
                 APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Release>:${lazycsv_LIB_DIRS_RELEASE}>)
    set_property(TARGET lazycsv::lazycsv
                 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${lazycsv_COMPILE_DEFINITIONS_RELEASE}>)
    set_property(TARGET lazycsv::lazycsv
                 APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${lazycsv_COMPILE_OPTIONS_RELEASE}>)

########## For the modules (FindXXX)
set(lazycsv_LIBRARIES_RELEASE lazycsv::lazycsv)
