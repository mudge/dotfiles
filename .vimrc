" filetype plugin (force toggle for pathogen)
filetype off

" use pathogen for vim plugins
call pathogen#runtime_append_all_bundles()

filetype plugin indent on

" vim-only mode.
set nocompatible


" highlight trailing whitespace
set list listchars=trail:.,tab:>.

" backups
set nobackup
set nowritebackup
set noswapfile

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
set grepprg=/opt/local/ack/bin/ack
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
let NERDTreeIgnore=['^\.DS_Store$', '\~$']

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
au BufRead,BufNewFile {Cap,Gem}file set ft=ruby
au BufRead,BufNewFile .bundle/config,.gemrc set ft=yaml
au BufRead,BufNewFile templates/*.html set ft=htmldjango

" python indentation
au FileType python setl sw=4 sts=4

" ctags
au FileType ruby setl tags+=/opt/local/etc/tags/ruby,/opt/local/etc/tags/gems iskeyword+=?,!
au FileType python setl tags+=/opt/local/etc/tags/django

" command-t mappings
map <leader>r :CommandTFlush<CR>
map <leader>t :CommandT<CR>

