packadd minpac

call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})

" sensible defaults
call minpac#add('tpope/vim-sensible')

" language support
call minpac#add('sheerun/vim-polyglot')
call minpac#add('sentient-lang/vim-sentient')

" pretty things
call minpac#add('itchyny/lightline.vim')
call minpac#add('arcticicestudio/nord-vim')
call minpac#add('NLKNguyen/papercolor-theme')

" editing
call minpac#add('dense-analysis/ale')
call minpac#add('godlygeek/tabular')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-endwise')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-eunuch')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-rhubarb')
call minpac#add('junegunn/fzf')

" integrations
call minpac#add('mudge/runspec.vim')

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

" tab completion for files
set wildmode=longest,list

" ignore certain standard directories
set wildignore+=*/vendor/bundler/*,*/.git/*,*/.hg/*,*/.bundle/*,*/vendor/cache/*,*/coverage/*,*.class,*.jar,*/node_modules/*

" allow buffers to be hidden without saving
set hidden

" default indentation rules
set expandtab shiftwidth=2 softtabstop=2

" leader
let mapleader = ","

" no line numbers when exporting HTML
let g:html_number_lines = 0

let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_fixers = {
\  'css': ['prettier'],
\  'scss': ['prettier'],
\  'javascript': ['prettier'],
\  'javascriptreact': ['prettier'],
\  'terraform': ['terraform'],
\}
let g:ale_fix_on_save = 1

" grep with ripgrep
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

" old ctrl-p habits die hard
nnoremap <c-p> :FZF<cr>

" disciplinary measures
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" use semi-colon to run tests
map ; <Plug>RunSpecRun

augroup mudge
  au!

  " jump to last opened position (taken from $VIMRUNTIME/vimrc_example.vim)
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif

  " detect filetypes
  " use set ft= instead of setf to ensure these filetypes take precedence.
  au BufRead,BufNewFile *.ronn set ft=markdown
  au BufRead,BufNewFile {Cap,Gem,Vagrant}file,.autotest,*.ru set ft=ruby
  au BufRead,BufNewFile Procfile,.bundle/config,.gemrc set ft=yaml
  au BufRead,BufNewFile *.sbt set ft=scala
  au BufRead,BufNewFile *.json set ft=javascript
  au BufRead,BufNewFile *.lalrpop set ft=rust

  " Enable spellchecking for Markdown and commit messages
  autocmd BufRead,BufNewFile *.markdown,*.md setlocal spell spelllang=en_gb
  autocmd FileType gitcommit setlocal spell spelllang=en_gb
augroup END

" strip trailing whitespace
function! StripWhitespace()
  exec ':%s/ \+$//gc'
endfunction
map <leader>s :call StripWhitespace()<CR>

set bg=light
colorscheme PaperColor
