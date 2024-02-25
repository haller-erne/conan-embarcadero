cmake_minimum_required(VERSION 3.19)
project(test_app)
 
add_executable(test_app main.cpp)

include_directories(${test_lib_INCLUDE_DIRS_DEBUG})

target_link_libraries(test_app 
    -L${test_lib_LIB_DIRS_DEBUG}   test_lib
)

option(BUILD_TESTS "" OFF)

if (BUILD_TEST)
    message(STATUS "building tests...")
    add_subdirectory(tests)
endif()