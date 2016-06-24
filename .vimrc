call plug#begin()

" sensible defaults
Plug 'tpope/vim-sensible'

" language support
Plug 'vim-ruby/vim-ruby'
Plug 'StanAngeloff/php.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'nelstrom/vim-subrip'
Plug 'tpope/vim-liquid'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'

" lisp
Plug 'kien/rainbow_parentheses.vim'

" pretty things
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'

" editing
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'

" integrations
Plug 'rking/ag.vim'
Plug 'mudge/runspec.vim'

call plug#end()

" disable modelines
set nomodeline

" disable code folding
set nofoldenable

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

" ui
set number
set nostartofline
set showmatch
set virtualedit=block
set list

" searching
set hlsearch
set incsearch

" tab completion for files
set wildmenu
set wildmode=longest,list

" ignore certain standard directories
set wildignore+=*/vendor/bundler/*,*/.git/*,*/.hg/*,*/.bundle/*,*/vendor/cache/*,*/coverage/*,*.class,*.jar

" colorscheme
set t_Co=256

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

set bg=dark
colorscheme solarized
