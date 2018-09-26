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
  NeoBundle 'scrooloose/syntastic'
  NeoBundle 'tpope/vim-endwise'
  NeoBundle 'vim-scripts/grep.vim'
  NeoBundle 'xolox/vim-session', {'depends' : 'xolox/vim-misc'}
call neobundle#end()

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
" vim-session
"==============================
let g:session_directory = $HOME . '/.vim/sessions' . getcwd()
if isdirectory(g:session_directory)
    " session保存ディレクトリを~/.vim/sessions/<cwd>に設定
    " vim終了時に自動保存
    let g:session_autosave = 'yes'
    " 引数なしでvimを起動した時にsession保存ディレクトリのdefault.vimを開く
    let g:session_autoload = 'yes'
    " 1分間に1回自動保存
    let g:session_autosave_periodic = 1
else 
    let g:session_autosave = 'no'
    let g:session_autoload = 'no'
endif

"==============================
" run plugin command 
"==============================
NeoBundleCheck
