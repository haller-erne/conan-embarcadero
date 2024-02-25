# Second iteration

## Environment setup

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

Then istall this as a custom user config:

``` cmd
:: install the the (local) settings_user.yml to the conan directory
conan config install settings_user.yml
```

This should show something like `Copying file settings_user.yml to C:\Users\Ahmad.Abbasian.A\.conan2\.`

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

Dann kann man die lib  bauen:

	cd test-lib
	conan build .  --profile=bcc32c

### Register the ninja generator for conan

To check the current configuration:

	conan config show tools.cmake.cmaketoolchain:generator

This should report `ninja`.

If not, then edit the global conan configuration: 

	notepad c:\users\<username>\.conan2\global.conf

Then add/change a line as follows:

	tools.cmake.cmaketoolchain:generator = Ninja

## Library build

### conanfile.py and conanfile.txt



### building

### installing



