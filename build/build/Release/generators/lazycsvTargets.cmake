# Load the debug and release variables
file(GLOB DATA_FILES "${CMAKE_CURRENT_LIST_DIR}/lazycsv-*-data.cmake")

foreach(f ${DATA_FILES})
    include(${f})
endforeach()

# Create the targets for all the components
foreach(_COMPONENT ${lazycsv_COMPONENT_NAMES} )
    if(NOT TARGET ${_COMPONENT})
        add_library(${_COMPONENT} INTERFACE IMPORTED)
        message(${lazycsv_MESSAGE_MODE} "Conan: Component target declared '${_COMPONENT}'")
    endif()
endforeach()

if(NOT TARGET lazycsv::lazycsv)
    add_library(lazycsv::lazycsv INTERFACE IMPORTED)
    message(${lazycsv_MESSAGE_MODE} "Conan: Target declared 'lazycsv::lazycsv'")
endif()
# Load the debug and release library finders
file(GLOB CONFIG_FILES "${CMAKE_CURRENT_LIST_DIR}/lazycsv-Target-*.cmake")

foreach(f ${CONFIG_FILES})
    include(${f})
endforeach()