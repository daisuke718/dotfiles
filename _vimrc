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
let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' .. substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif

" Set Dein base path (required)
let s:dein_base = '/Users/hiromitsudaisuke/.cache/dein'

" Set Dein source path (required)
let s:dein_src = '/Users/hiromitsudaisuke/.cache/dein/repos/github.com/Shougo/dein.vim'

" Set Dein runtime path (required)
execute 'set runtimepath+=' . s:dein_src

call dein#begin(s:dein_base)

" plugins:
call dein#add(s:dein_src)
call dein#add('scrooloose/syntastic')
call dein#add('vim-scripts/grep.vim')
call dein#add('xolox/vim-misc')

call dein#end()

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
