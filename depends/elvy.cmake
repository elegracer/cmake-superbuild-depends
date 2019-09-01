if(NOT TARGET depends::elvy)
    FetchContent_Declare(
        depends-elvy
        GIT_REPOSITORY https://github.com/elegracer/elvy.git
        GIT_TAG        master
        GIT_SHALLOW    TRUE
    )
    FetchContent_GetProperties(depends-elvy)
    if(NOT depends-elvy_POPULATED)
        message(STATUS "Fetching elvy sources")
        FetchContent_Populate(depends-elvy)
        message(STATUS "Fetching elvy sources - done")
    endif()
    set(ELVY_DEBUG OFF CACHE BOOL "" FORCE)
    set(ELVY_BUILD_TESTS OFF CACHE BOOL "" FORCE)
    set(ELVY_BUILD_UTILS OFF CACHE BOOL "" FORCE)
    add_subdirectory(${depends-elvy_SOURCE_DIR} ${depends-elvy_BINARY_DIR})
    add_library(depends::elvy INTERFACE IMPORTED GLOBAL)
    target_link_libraries(depends::elvy INTERFACE elvy)
    set(depends-elvy-source-dir ${depends-elvy_SOURCE_DIR} CACHE INTERNAL "" FORCE)
    set(depends-elvy-binary-dir ${depends-elvy_BINARY_DIR} CACHE INTERNAL "" FORCE)
    mark_as_advanced(depends-elvy-source-dir)
    mark_as_advanced(depends-elvy-binary-dir)
endif()
