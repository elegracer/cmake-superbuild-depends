if(NOT TARGET depends::nanovis-mitsuba)
    FetchContent_Declare(
        depends-nanovis-mitsuba
        GIT_REPOSITORY https://github.com/elegracer/nanovis-mitsuba.git
        GIT_TAG        master
        GIT_SHALLOW    TRUE
    )
    FetchContent_GetProperties(depends-nanovis-mitsuba)
    if(NOT depends-nanovis-mitsuba_POPULATED)
        message(STATUS "Fetching nanovis-mitsuba sources")
        FetchContent_Populate(depends-nanovis-mitsuba)
        message(STATUS "Fetching nanovis-mitsuba sources - done")
    endif()
    set(NANOVIS_BUILD_EXAMPLE OFF CACHE BOOL "" FORCE)
    add_subdirectory(${depends-nanovis-mitsuba_SOURCE_DIR} ${depends-nanovis-mitsuba_BINARY_DIR})
    add_library(depends::nanovis-mitsuba INTERFACE IMPORTED GLOBAL)
    target_link_libraries(depends::nanovis-mitsuba INTERFACE nanovis)
    set(depends-nanovis-mitsuba-source-dir ${depends-nanovis-mitsuba_SOURCE_DIR} CACHE INTERNAL "" FORCE)
    set(depends-nanovis-mitsuba-binary-dir ${depends-nanovis-mitsuba_BINARY_DIR} CACHE INTERNAL "" FORCE)
    mark_as_advanced(depends-nanovis-mitsuba-source-dir)
    mark_as_advanced(depends-nanovis-mitsuba-binary-dir)
endif()
