"=============================
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
  NeoBundle 'plasticboy/vim-markdown'
  NeoBundle 'kannokanno/previm'
  NeoBundle 'tyru/open-browser.vim'
  NeoBundle 'Shougo/neocomplete'
  NeoBundle 'scrooloose/syntastic'
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'tpope/vim-endwise'
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
set visualbell t_vb= 
set incsearch
set wildmenu wildmode=list:longest
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backup
set backupdir=~/backup/vim/
au BufWritePre * let &bex = '.' . strftime("%Y-%m-%d_%H:%M:%S")
set noswapfile
set autoindent
set backspace=indent
set expandtab
set hlsearch
set nowrap

syntax on

set number

au BufRead,BufNewFile *.md set filetype=markdown

filetype plugin indent on

inoremap <D-v> ":set paste<CR><D-v>:set nopaste"
nnoremap <F3> :vsp<CR> <C-w>l :exec("tjump ".expand('<cword>'))<CR>

set clipboard=unnamed
vnoremap <silent> p "_d"*p

"==============================
" syntastic
"==============================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set signcolumn=yes
highlight SignColumn guibg=black ctermbg=black

let g:syntastic_enable_signs=1 " エラー行に「>>」を表示
let g:syntastic_always_populate_loc_list = 1 " 他プラグイン競合防止
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {'mode': 'passive'}
"augroup AutoSyntastic
"    autocmd!
"    autocmd InsertLeave,TextChanged * call s:syntastic()
"augroup END
"function! s:syntastic()
"    w
"    SyntasticCheck
"endfunction

"==============================
" NERDTree
"==============================
nnoremap <C-h> :NERDTree<CR>

"==============================
" run plugin command 
"==============================
NeoBundleCheck
