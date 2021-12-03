" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible
  endif
endif

"=============================
" dein.vim (plugin manager)
"==============================
set runtimepath+=~/.vim/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/.cache/dein')
  call dein#begin('~/.vim/.cache/dein')

  " plugins:
  call dein#add('Shougo/dein.vim')
  call dein#add('scrooloose/syntastic')
  call dein#add('vim-scripts/grep.vim')
  call dein#add('xolox/vim-misc')

  call dein#end()
  call dein#save_state()
endif

" 未インストールプラグインがあったらインストールする
if dein#check_install()
  call dein#install()
endif
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

" statusline
set laststatus=2
set statusline=%f
set statusline+=%m
set statusline+=%r
set statusline+=%=
set statusline+=[%Y]
set statusline+=[%{&fileencodings}]
set statusline+=[%l:%v]

syntax on

set number

highlight Search cterm=NONE ctermfg=black ctermbg=yellow

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile ~/.ssh/conf.d/* setf sshconfig

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

"==============================
" vimdiffの色設定
"==============================
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21
