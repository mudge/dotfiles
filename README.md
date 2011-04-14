My configuration files for vim, etc. that I use on various machines.

A lot of my .vimrc is lifted from [Ryan Tomayko's configuration][rtomayko]
so thanks to him for providing such an invaluable resource.

  [rtomayko]: http://github.com/rtomayko/dotfiles

## Usage

As most (if not all) my Vim plugins are [git submodules][] you will need to run the following commands once you have cloned this repository:

    $ git submodule init
    $ git submodule update

## Vim Plugins

* Wincent Colaiuta's [Command-T][] (modified to work around [an issue with Vim 7.3](https://wincent.com/issues/1617));
* Benji Fisher's [matchit][];
* Marty Grenfell's [NERDTree][] and [NERDCommenter][];
* Tim Pope's [endwise][], [fugitive][], [pathogen.vim][], [rails.vim][], [repeat.vim][] and [surround.vim][].

## Vim Color Schemes

* Ethan Schoonover's [Solarized][].

  [Command-T]: http://www.vim.org/scripts/script.php?script_id=3025
  [NERDTree]: http://www.vim.org/scripts/script.php?script_id=1658
  [endwise]: http://www.vim.org/scripts/script.php?script_id=2386
  [fugitive]: http://www.vim.org/scripts/script.php?script_id=2975
  [pathogen.vim]: http://www.vim.org/scripts/script.php?script_id=2332
  [matchit]: http://www.vim.org/scripts/script.php?script_id=39
  [rails.vim]: http://www.vim.org/scripts/script.php?script_id=1567
  [repeat.vim]: http://www.vim.org/scripts/script.php?script_id=2136
  [surround.vim]: http://www.vim.org/scripts/script.php?script_id=1697
  [NERDCommenter]: https://github.com/scrooloose/nerdcommenter
  [Solarized]: http://ethanschoonover.com/solarized
  [git submodules]: http://book.git-scm.com/5_submodules.html

