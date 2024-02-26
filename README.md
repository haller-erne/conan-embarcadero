# Using conan2 with Embarcadero C++Builder

Although Embarcadero ships its own package manager [GetIt](https://getitnow.embarcadero.com/), this is not an open infrastructure and tightly coupled to the IDE.

As [Embarcadero C++ Builder](https://www.embarcadero.com/de/products/cbuilder) finally supports CMake (to some extent), here is an experiment to make C++ Builder work with [Conan2](https://conan.io/). The main target of this repo is not to actually use the large ecosystem of C++ packages provided in the [ConanCenter public package repository](https://conan.io/center) (as the Embarcadero compiler is simply too non-standard-C++ conformat to compile almost any current C++ package), but to use [Conan2](https://conan.io/) to internally manage packages and dependencies (using the local cache or the self-hosted [JFrog Artifactory community edition for C++](https://conan.io/downloads)).

## Environment setup

To make conan2 work with C++Builder, the CMake and Conan environments must be manually modified.

This needs the following steps (shown in detail below):

1. Setup the CMake environment according to Embarcaderos description in the DocWiki (see [Using CMake with C++ Builder](https://docwiki.embarcadero.com/RADStudio/Athens/en/Using_CMake_with_C%2B%2B_Builder))
2. Define and register a custom compiler configuration for Conan2 (see [here](#define-a-conan-user-setting-for-embarcadero-bcc32c))
3. Add a conan profile for the Embarcadero C++ compiler (see [here](#add-a-conan-profile-for-embarcadero-bcc32c))
4. Register the Ninja generator for conan (see [here](#register-the-ninja-generator-for-conan))


### Define a conan user setting for Embarcadero bcc32c

See [Conan user settings](https://docs.conan.io/2.0/examples/config_files/settings/settings_user.html) on how to setup a custom conan settings file.

First, create a config file as follows to register the Embarcadero compiler:

``` yaml
# settings_user.yml
compiler:
    bcc32c:
        version: ["7.30"]
        threads: [null, "posix"]
```

Then install this as a custom user config:

``` cmd
rem Install the the (local) settings_user.yml to the conan directory
conan config install settings_user.yml
```

This should show something like `Copying file settings_user.yml to C:\Users\<username>\.conan2\.`


### Add a conan profile for Embarcadero bcc32c

Create a new file, named `bcc32c.conanprofile` as follows:

``` ini
[settings]
compiler=bcc32c
os=Windows
arch=x86_64
compiler.version=7.30
build_type=Debug
```

Install the profile by copying to the users conan profile folder:

``` cmd
copy bcc32c.conanprofile %homedrive%%homepath%\.conan2\profiles\bcc32c
```

### Register the ninja generator for conan

To check the current configuration:

``` cmd
conan config show tools.cmake.cmaketoolchain:generator
```

This should report `ninja`.

If not, then edit the global conan configuration: 

``` cmd
notepad c:\users\<username>\.conan2\global.conf
```

Then add/change a line as follows:

``` cmd
tools.cmake.cmaketoolchain:generator = Ninja
```

## Building the library

### Building and installing

Then build the library by:

``` cmd
cd test-lib
./build-lib.cmd
```

This basically runs the following commands in a sequence:

- Install required dependencies for the build

	conan . install --profile=bcc32c

- Actually build the library

	conan . build --profile=bcc32c

- Install the generated library into the local cache

	conan . create --profile=bcc32c

### Checking

To check, if the library was correctly installed into the local cache, run the following command:

``` cmd
	::list all locally installed packages
	conan list *
```

## Building the application / consuming the library

To build the application, do:

``` cmd
cd test-app
./build-app.cmd
```

This basically runs the following commands in a sequence:

- Install required dependencies for the build

	conan install ./conanfile.txt --output-folder build/Debug --profile=bcc32c

- Actually build the library

	conan build . --profile=bcc32c

The build executable can be found in `build/debug/src`

