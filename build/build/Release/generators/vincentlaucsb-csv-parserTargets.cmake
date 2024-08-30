# Load the debug and release variables
file(GLOB DATA_FILES "${CMAKE_CURRENT_LIST_DIR}/vincentlaucsb-csv-parser-*-data.cmake")

foreach(f ${DATA_FILES})
    include(${f})
endforeach()

# Create the targets for all the components
foreach(_COMPONENT ${vincentlaucsb-csv-parser_COMPONENT_NAMES} )
    if(NOT TARGET ${_COMPONENT})
        add_library(${_COMPONENT} INTERFACE IMPORTED)
        message(${vincentlaucsb-csv-parser_MESSAGE_MODE} "Conan: Component target declared '${_COMPONENT}'")
    endif()
endforeach()

if(NOT TARGET vincentlaucsb-csv-parser::vincentlaucsb-csv-parser)
    add_library(vincentlaucsb-csv-parser::vincentlaucsb-csv-parser INTERFACE IMPORTED)
    message(${vincentlaucsb-csv-parser_MESSAGE_MODE} "Conan: Target declared 'vincentlaucsb-csv-parser::vincentlaucsb-csv-parser'")
endif()
# Load the debug and release library finders
file(GLOB CONFIG_FILES "${CMAKE_CURRENT_LIST_DIR}/vincentlaucsb-csv-parser-Target-*.cmake")

foreach(f ${CONFIG_FILES})
    include(${f})
endforeach()