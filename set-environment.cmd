@echo off
set path="c:\Program Files\Conan\conan\";%path%
cmake --version
ninja --version
conan --version
conan config show tools.cmake.cmaketoolchain:generator
conan profile list
::conan profile show

