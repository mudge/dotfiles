My configuration files for vim, etc. that I use on various machines.

A lot of my .vimrc is lifted from [Ryan Tomayko's configuration][rtomayko]
so thanks to him for providing such an invaluable resource.

  [rtomayko]: http://github.com/rtomayko/dotfiles

## Usage

As my Vim plugins are managed with [minpac][], you will first need to install
it like so:

    $ git clone https://github.com/k-takata/minpac.git \
          ~/.vim/pack/minpac/opt/minpac

And then run the following command inside vim:

    :call minpac#update()

  [minpac]: https://github.com/k-takata/minpac
