set(CMAKE_C_COMPILER "bcc32c")
set(CMAKE_CXX_COMPILER "bcc32c")
set (CMAKE_GENERATOR "Ninja" CACHE INTERNAL "" FORCE)
cmake_minimum_required(VERSION 3.19)
project(test_project)
add_subdirectory(include)
add_subdirectory(src)

option(BUILD_EXAMPLES "Whether or not to build examples" OFF)

if (BUILD_EXAMPLES)
    message(STATUS "building examples---")
    add_subdirectory(examples)
endif()