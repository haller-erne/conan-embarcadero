
:: remove previous version from cache
::conan remove test_lib/0.1

:: install possible dependencies
conan install . --profile=bcc32c 
:: build using conan
conan build . --profile=bcc32c 
:: test the package
::conan test

goto :end
:: build using cmake
:build-cmake
pushd build
cmake -DCMAKE_C_COMPILER=bcc32c -DCMAKE_CXX_COMPILER=bcc32c -G Ninja ../
ninja
popd
:end