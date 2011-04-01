" use pathogen for vim plugins
call pathogen#runtime_append_all_bundles()

filetype plugin indent on

" vim-only mode.
set nocompatible

" highlight trailing whitespace
set list listchars=trail:·,tab:>-

" backups and swapfiles
set nobackup
set noswapfile

try
  " persistent undo
  set undodir=~/.vim/undodir
  set undofile

  set colorcolumn=85
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
set backspace=2

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

" searching
set hlsearch
set incsearch

" leader
let mapleader = ","

" syntax highlighting
syntax on

" NERDTree settings
map <leader>d :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['^\.DS_Store$', '\~$', '\.gem$', '\.war$']

" fugitive settings
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2

" jump to last opened position
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
                         \ exe "normal g'\"" | endif

" strip trailing whitespace
function! StripWhitespace()
    exec ':%s/ \+$//gc'
endfunction
map <leader>s :call StripWhitespace()<CR>

" detect filetypes
" use set ft= instead of setf to ensure these
" filetypes take precedence.
au BufRead,BufNewFile *.md set ft=mkd
au BufRead,BufNewFile {Cap,Gem,Vagrant}file,.autotest,*.ru set ft=ruby
au BufRead,BufNewFile .bundle/config,.gemrc set ft=yaml
au BufRead,BufNewFile templates/*.html set ft=htmldjango

" python and puppet indentation
au FileType python,puppet setl sw=4 sts=4

" command-t mappings
map <leader>r :CommandTFlush<CR>
map <leader>t :CommandT<CR>

" restrict the maximum height of the command-t window
let g:CommandTMaxHeight=20

map <leader><Bar> :Tabularize /<Bar><CR>

colorscheme solarized
