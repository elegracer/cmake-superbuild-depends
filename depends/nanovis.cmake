if(NOT TARGET depends::nanovis)
    FetchContent_Declare(
        depends-nanovis
        GIT_REPOSITORY https://github.com/elegracer/nanovis.git
        GIT_TAG        lvo
        GIT_SHALLOW    TRUE
    )
    FetchContent_GetProperties(depends-nanovis)
    if(NOT depends-nanovis_POPULATED)
        message(STATUS "Fetching nanovis sources")
        FetchContent_Populate(depends-nanovis)
        message(STATUS "Fetching nanovis sources - done")
    endif()
    set(NANOVIS_BUILD_EXAMPLE OFF CACHE BOOL "" FORCE)
    add_subdirectory(${depends-nanovis_SOURCE_DIR} ${depends-nanovis_BINARY_DIR})
    add_library(depends::nanovis INTERFACE IMPORTED GLOBAL)
    target_link_libraries(depends::nanovis INTERFACE nanovis)
    set(depends-nanovis-source-dir ${depends-nanovis_SOURCE_DIR} CACHE INTERNAL "" FORCE)
    set(depends-nanovis-binary-dir ${depends-nanovis_BINARY_DIR} CACHE INTERNAL "" FORCE)
    mark_as_advanced(depends-nanovis-source-dir)
    mark_as_advanced(depends-nanovis-binary-dir)
endif()
