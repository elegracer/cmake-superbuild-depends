if(NOT TARGET depends::opencv)
    find_package(OpenCV REQUIRED)
    if (NOT ${OpenCV_VERSION_MAJOR} STREQUAL "4")
        message(FATAL_ERROR "OpenCV version is not 4.x, please update OpenCV to 4.x")
    endif()
    add_library(depends::opencv INTERFACE IMPORTED GLOBAL)
    target_include_directories(depends::opencv INTERFACE ${OpenCV_INCLUDE_DIRS})
    target_link_libraries(depends::opencv INTERFACE ${OpenCV_LIBS})
endif()
