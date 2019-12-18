if(NOT TARGET depends::enoki)
    if(NOT TARGET options::modern-cpp)
        message(FATAL_ERROR "depends::enoki expects options::modern-cpp")
    endif()
    FetchContent_Declare(
        depends-enoki
        GIT_REPOSITORY https://github.com/mitsuba-renderer/enoki.git
        GIT_TAG        master
        GIT_SHALLOW    TRUE
    )
    FetchContent_GetProperties(depends-enoki)
    if(NOT depends-enoki_POPULATED)
        message(STATUS "Fetching enoki sources")
        FetchContent_Populate(depends-enoki)
        message(STATUS "Fetching enoki sources - done")
    endif()
    add_library(depends::enoki INTERFACE IMPORTED GLOBAL)
    target_link_libraries(depends::enoki INTERFACE options::modern-cpp)
    target_include_directories(depends::enoki INTERFACE ${depends-enoki_SOURCE_DIR}/include)
    set(depends-enoki-source-dir ${depends-enoki_SOURCE_DIR} CACHE INTERNAL "" FORCE)
    mark_as_advanced(depends-enoki-source-dir)
endif()
