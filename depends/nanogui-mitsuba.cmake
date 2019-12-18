if(NOT TARGET depends::nanogui-mitsuba)
    FetchContent_Declare(
        depends-nanogui-mitsuba
        GIT_REPOSITORY https://github.com/elegracer/nanogui-mitsuba.git
        GIT_TAG        master
        GIT_SHALLOW    TRUE
    )
    FetchContent_GetProperties(depends-nanogui-mitsuba)
    if(NOT depends-nanogui-mitsuba_POPULATED)
        message(STATUS "Fetching nanogui-mitsuba sources")
        FetchContent_Populate(depends-nanogui-mitsuba)
        message(STATUS "Fetching nanogui-mitsuba sources - done")
    endif()
    set(NANOGUI_BUILD_EXAMPLE OFF CACHE BOOL "" FORCE)
    add_subdirectory(${depends-nanogui-mitsuba_SOURCE_DIR} ${depends-nanogui-mitsuba_BINARY_DIR})
    add_library(depends::nanogui-mitsuba INTERFACE IMPORTED GLOBAL)
    target_link_libraries(depends::nanogui-mitsuba INTERFACE nanogui)
    set(depends-nanogui-mitsuba-source-dir ${depends-nanogui-mitsuba_SOURCE_DIR} CACHE INTERNAL "" FORCE)
    set(depends-nanogui-mitsuba-binary-dir ${depends-nanogui-mitsuba_BINARY_DIR} CACHE INTERNAL "" FORCE)
    mark_as_advanced(depends-nanogui-mitsuba-source-dir)
    mark_as_advanced(depends-nanogui-mitsuba-binary-dir)
endif()
