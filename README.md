My configuration files for vim, etc. that I use on various machines.

A lot of my .vimrc is lifted from [Ryan Tomayko's configuration][rtomayko]
so thanks to him for providing such an invaluable resource.

  [rtomayko]: http://github.com/rtomayko/dotfiles

## Usage

As my Vim plugins are managed with [Vundle][], you will need to first checkout Vundle as a git submodule once you have cloned this repository:

    $ git submodule init
    $ git submodule update

And then run the following command inside vim:

    :BundleInstall

  [Vundle]: https://github.com/gmarik/vundle
