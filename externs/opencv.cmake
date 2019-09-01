if(NOT TARGET depends::opencv)
    find_package(OpenCV REQUIRED)
    if (NOT ${OpenCV_VERSION} STREQUAL "4.1.1")
        message(FATAL_ERROR "OpenCV version is not 4.1.1, please update OpenCV to 4.1.1")
    endif()
    add_library(depends::opencv INTERFACE IMPORTED GLOBAL)
    target_link_libraries(depends::opencv INTERFACE ${OpenCV_LIBS})
endif()
