Building with C++Builder and cmake

See [Using CMake with C++Builder](https://docwiki.embarcadero.com/RADStudio/Athens/en/Using_CMake_with_C%2B%2B_Builder)

``` cmd
cd build
cmake -DCMAKE_C_COMPILER=bcc32x.exe -DCMAKE_CXX_COMPILER=bcc32x.exe -G Ninja ../
ninja
```

You will find the build results in `build/src/`.

Other command-line flags
-G”Borland Makefiles” to use old-fashioned make to build.
-DCMAKE_BUILD_TYPE_INIT=Release to target debug or release builds.
-DCMAKE_VERBOSE_MAKEFILE:BOOL=ON for easier to debug output.
--debug-output to put CMake in debug mode.