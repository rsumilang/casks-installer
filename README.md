# Casks Apps

The goal here is to automate installing apps I use. This makes it fast to setup
a new machine with the tools I need by removing the "To install, drag this icon..."
process.

The apps have been broken up by category. To install, simply run:

    ./install.sh [category]

The category is simply one of the file names in the `category` folder. Omitting
this option will install all the categories onto the machine.

## Notes

The default location cask uses for Application shortcuts is `~/Applications`. I
change this setting in my install command to point to `/Applications`.

# License

This was created by [Richard Sumilang](http://richardsumilang.com/) and is
licensed under the [CC BY-SA 3.0](http://creativecommons.org/licenses/by-sa/3.0/)
license. You are encouraged to fork this repository and make adjustments
according to your preferences.

![Creative Commons License](http://i.creativecommons.org/l/by-sa/3.0/88x31.png)
