
:: install possible dependencies
conan install ./conanfile.txt --output-folder build/Debug --profile=bcc32c
:: build using conan
::conan build . --profile=bcc32c 
:: test the package
::conan test

goto :end
:: build using cmake
pushd build
cmake -DCMAKE_C_COMPILER=bcc32c -DCMAKE_CXX_COMPILER=bcc32c -G Ninja ../
ninja
popd
:end