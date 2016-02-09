"==============================
" NeoBundle plugin 
"==============================
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  NeoBundle 'Shougo/neocomplete'
"  NeoBundle 'soramugi/auto-ctags.vim'
call neobundle#end()

"==============================
" neocomplete
"==============================
if neobundle#is_installed('neocomplete')
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_ignore_case = 1
    let g:neocomplete#enable_smart_case = 1
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns._ = '\h\w*'
endif
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"


"==============================
" auto-ctags
"==============================
"let g:auto_ctags = 1 
"let g:auto_ctags_directory_list = ['.git']

"==============================
" General Settings
"==============================
set encoding=utf-8
set fileencodings=utf-8,sjis
set clipboard=unnamed
set visualbell t_vb= 
set incsearch
set wildmenu wildmode=list:longest

syntax on

set number

au BufRead,BufNewFile *.md set filetype=markdown

filetype plugin indent on

inoremap <D-v> ":set paste<CR><D-v>:set nopaste"
nnoremap <F3> :vsp<CR> <C-w>l :exec("tjump ".expand('<cword>'))<CR>
