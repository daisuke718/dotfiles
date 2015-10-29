set clipboard=unnamed
set visualbell t_vb= 
set incsearch
set wildmenu wildmode=list:longest

syntax on

set number

au BufRead,BufNewFile *.md set filetype=markdown

"=============================="
"=== NeoBundle plugin       ==="
"=============================="
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
call neobundle#end()

filetype plugin indent on

