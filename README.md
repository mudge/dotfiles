My configuration files for vim, etc. that I use on various machines.

A lot of my .vimrc is lifted from [Ryan Tomayko's configuration][rtomayko]
so thanks to him for providing such an invaluable resource.

  [rtomayko]: http://github.com/rtomayko/dotfiles

## Usage

As my Vim plugins are managed with [vim-plug][], you will first need to install it like so:

    $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

And then run the following command inside vim:

    :PlugInstall

  [vim-plug]: https://github.com/junegunn/vim-plug
