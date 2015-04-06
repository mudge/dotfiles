" vim-onlymode.
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage itself
Plugin 'gmarik/Vundle.vim'

" language support
Plugin 'vim-ruby/vim-ruby'
Plugin 'StanAngeloff/php.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'nelstrom/vim-subrip'

" lisp
Plugin 'kien/rainbow_parentheses.vim'

" pretty things
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'

" editing
Plugin 'godlygeek/tabular'
Plugin 'matchit.zip'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-cucumber'
Plugin 'kien/ctrlp.vim'

" integrations
Plugin 'rking/ag.vim'
Plugin 'mudge/runspec.vim'

call vundle#end()
filetype plugin indent on

" disable modelines
set nomodeline

" disable code folding
set nofoldenable

" set encoding so unicode listchars can be used
set encoding=utf-8

" highlight trailing whitespace
set list listchars=trail:·,tab:>-

" backups and swapfiles
set nobackup
set noswapfile

try
  " persistent undo
  set undodir=$HOME/.vim/undodir
  set undofile

  set colorcolumn=+1
catch /Unknown option/
  " For versions of Vim prior to 7.3.
endtry

" 2 spaces for tabs.
set autoindent
set smartindent
set softtabstop=2
set shiftwidth=2
set tabstop=4
set expandtab
set nosmarttab

" sensible backspace behaviour
set backspace=indent,eol,start

" ui
set ruler
set noshowcmd
set nolazyredraw
set number
set nostartofline
set showmatch
set virtualedit=block
set showtabline=2

" searching
set hlsearch
set incsearch

" tab completion for files
set wildmenu
set wildmode=longest,list

" ignore certain standard directories
set wildignore+=*/vendor/bundler/*,*/.git/*,*/.hg/*,*/.bundle/*,*/vendor/cache/*,*/coverage/*,*.class,*.jar

" always show the status line
set laststatus=2

" colorscheme
set t_Co=256

" give a little breathing room when scrolling
set scrolloff=3

" allow buffers to be hidden without saving
set hidden

" so that things like rbenv Just Work
set shell=/bin/bash

" leader
let mapleader = ","

" no line numbers when exporting HTML
let g:html_number_lines = 0

" airline settings
let g:airline_left_sep = ""
let g:airline_right_sep = ""

" paredit settings
let g:paredit_smartjump = 1

" ctrl-p settings
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.vim/ctrlpdir'

" syntax highlighting
syntax enable
syntax sync minlines=256

" disciplinary measures
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" use semi-colon to run tests
map ; <Plug>RunSpecRun

" clear highlight with ,c
" note that using <CR> is to enter a world of pain as the mapping needs
" to be cleared for both command windows and quickfix lists so choosing a
" simpler binding was easier.
nnoremap <leader>c :nohlsearch<CR>

augroup mudge
  autocmd!

  autocmd FileType text,markdown,ruby setlocal textwidth=78
  autocmd FileType php setlocal sw=4 sts=4

  " jump to last opened position (taken from $VIMRUNTIME/vimrc_example.vim)
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  " detect filetypes
  " use set ft= instead of setf to ensure these filetypes take precedence.
  au BufRead,BufNewFile *.ronn set ft=markdown
  au BufRead,BufNewFile {Cap,Gem,Vagrant}file,.autotest,*.ru set ft=ruby
  au BufRead,BufNewFile Procfile,.bundle/config,.gemrc set ft=yaml
  au BufRead,BufNewFile *.sbt set ft=scala
  au BufRead,BufNewFile *.json set ft=javascript

  " disable cindent for JavaScript for sane indentation.
  au FileType javascript setlocal nocindent sw=4 sts=4

  " python indentation.
  au FileType python setlocal sw=4 sts=4

  " automatically reload any changes to this file
  au BufWritePost .vimrc source $MYVIMRC

  " rainbow parentheses
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces
augroup END

" strip trailing whitespace
function! StripWhitespace()
  exec ':%s/ \+$//gc'
endfunction
map <leader>s :call StripWhitespace()<CR>

" rename current file (from
" https://github.com/garybernhardt/dotfiles/blob/master/.vimrc)
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

set bg=dark
colorscheme solarized

