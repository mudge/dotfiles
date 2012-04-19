" vim-only mode.
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage itself
Bundle 'gmarik/vundle'

Bundle 'mudge/runspec.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'bdd/vim-scala'
Bundle 'JavaScript-Indent'
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
Bundle 'kogent/vim-puppet'
Bundle 'matchit.zip'
Bundle 'nginx.vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'

filetype plugin indent on

" disable modelines
set nomodeline

" use the system clipboard
if has("clipboard")
  set clipboard=unnamed
endif

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
  set undodir=~/.vim/undodir
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

" use ack instead of grep
set grepprg=ack
set grepformat=%f:%l:%m

" ui
set ruler
set noshowcmd
set nolazyredraw
set number
set nostartofline
set cursorline
set showmatch
set virtualedit=block
set showtabline=2

" searching
set hlsearch
set incsearch

" tab completion for files
set wildmenu

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

" leader
let mapleader = ","

" syntax highlighting
syntax on

" disciplinary measures
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

augroup mudge
  autocmd!

  autocmd FileType text,markdown setlocal textwidth=78

  " jump to last opened position (taken from
  " $VIMRUNTIME/vimrc_example.vim)
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  " detect filetypes
  " use set ft= instead of setf to ensure these
  " filetypes take precedence.
  au BufRead,BufNewFile *.ronn set ft=markdown
  au BufRead,BufNewFile {Cap,Gem,Vagrant}file,.autotest,*.ru set ft=ruby
  au BufRead,BufNewFile Procfile,.bundle/config,.gemrc set ft=yaml
  au BufRead,BufNewFile *.sbt set ft=scala
  au BufRead,BufNewFile *.json set ft=javascript

  " disable cindent for JavaScript for sane indentation.
  au FileType javascript setlocal nocindent sw=4 sts=4

  " python indentation
  au FileType python setlocal sw=4 sts=4
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

