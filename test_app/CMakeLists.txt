set(CMAKE_C_COMPILER "bcc32c")
set(CMAKE_CXX_COMPILER "bcc32c")
set (CMAKE_GENERATOR "Ninja" CACHE INTERNAL "" FORCE)
cmake_minimum_required(VERSION 3.19)
project(test_app)
 set(CMAKE_TOOLCHAIN_FILE ${CMAKE_BINARY_DIR}/conan_toolchain.cmake)
find_package(test_lib PATHS ${CMAKE_BINARY_DIR})
add_subdirectory(src)

