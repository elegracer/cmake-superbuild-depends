if(NOT TARGET depends::nanogui)
    FetchContent_Declare(
        depends-nanogui
        GIT_REPOSITORY https://github.com/elegracer/nanogui.git
        GIT_TAG        master
        GIT_SHALLOW    TRUE
    )
    FetchContent_GetProperties(depends-nanogui)
    if(NOT depends-nanogui_POPULATED)
        message(STATUS "Fetching nanogui sources")
        FetchContent_Populate(depends-nanogui)
        message(STATUS "Fetching nanogui sources - done")
    endif()
    set(NANOGUI_BUILD_EXAMPLE OFF CACHE BOOL "" FORCE)
    add_subdirectory(${depends-nanogui_SOURCE_DIR} ${depends-nanogui_BINARY_DIR})
    add_library(depends::nanogui INTERFACE IMPORTED GLOBAL)
    target_link_libraries(depends::nanogui INTERFACE nanogui)
    set(depends-nanogui-source-dir ${depends-nanogui_SOURCE_DIR} CACHE INTERNAL "" FORCE)
    set(depends-nanogui-binary-dir ${depends-nanogui_BINARY_DIR} CACHE INTERNAL "" FORCE)
    mark_as_advanced(depends-nanogui-source-dir)
    mark_as_advanced(depends-nanogui-binary-dir)
endif()
