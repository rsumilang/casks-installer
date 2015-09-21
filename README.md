# Casks Apps

The goal here is to automate installing apps I use. This makes it fast and easy
to setup a new workstation with the tools I need by removing the "To install,
drag this icon..." process.

The apps have been broken up by category. To install, simply run:

    ruby install.rb [category]

The category is simply one of the file names in the `category` folder. Omitting
this option will install all the categories onto the machine.

If you don't have `brew` installed then the script will automaticlly fetch the
latest version and install it. It will also install `cask` to save you some time.

## Options

  **appdir:** The default location cask uses for Application shortcuts is
       `~/Applications`. I change this setting in my install command to point to
       `/Applications`.

  Default: /Applications

  Example:

    --appdir=/Applications

  **category:** Name of the application category group to install (or
       uninstall). The category name should reference a file in the `./category/`
       directory, excluding the file extension. If no category group is specified
       then all will be installed.
  
  Example:
  
      --category=browsers
  
  or:
  
      -c browser
      
  **uninstall:** This changes the default `install` option to `uninstall`. With
       this flag on you can uninstall a category group or uninstall everything.
       This option requires no additional arguments.
  
  Example:
  
      --uninstall
  
  or
  
      -u


# License

This was created by [Richard Sumilang](http://richardsumilang.com/) and is
licensed under the [CC BY-SA 3.0](http://creativecommons.org/licenses/by-sa/3.0/)
license. You are encouraged to fork this repository and make adjustments
according to your preferences.

![Creative Commons License](http://i.creativecommons.org/l/by-sa/3.0/88x31.png)
