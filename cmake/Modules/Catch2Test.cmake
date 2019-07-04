include(FetchContent)
FetchContent_Declare(
    catch2
    GIT_REPOSITORY https://github.com/catchorg/Catch2.git
    GIT_TAG        v2.9.1
)
if(NOT catch2_POPULATED)
    message(STATUS "Fetching Catch2 sources")
    FetchContent_Populate(catch2)
    message(STATUS "Fetching Catch2 sources - done")
endif()
add_subdirectory(${catch2_SOURCE_DIR} ${catch2_BINARY_DIR})
list(APPEND CMAKE_MODULE_PATH "${catch2_SOURCE_DIR}/contrib")
include(CTest)
include(ParseAndAddCatchTests)
