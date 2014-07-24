
if has("gui") && has("mac")
    colorscheme zellner
    set guifont=Monaco:h14
endif
if has("win32")
"    source $VIMRUNTIME/vimrc_example.vim
"    source $VIMRUNTIME/mswin.vim
"    gvim和vim on cygwin共用.vim文件夹
    set rtp+=$HOME/.vim
endif

" set undo dir and enable undo
if has("persistent_undo")
    set undodir='~/.vim/undodir/'
    set undofile
endif

" bundle support
execute pathogen#infect()

"一般设定
"set guioptions+=a
"set mouse=a
"set relativenumber
let mapleader=","
set scrolloff=2
set sidescrolloff=10
set linespace=5
set number
set ignorecase smartcase
set noswapfile
set confirm
set clipboard=unnamed   "使用系统剪贴板做为VIM的默认寄存器，这样方便VIM和别的程序交换数据
set fileformat=unix
set ruler		" show the cursor position all the time
set incsearch		" do incremental searching
set nobackup
set nocompatible
set foldmethod=marker
set nowrapscan
set wildmenu
set nowrap
set history=100		" keep 50 lines of command line history
set showcmd		" display incomplete commands
set backspace=indent,eol,start
set viminfo='100,n~/.vim/viminfo
if has("win32")
    set viminfo='100,n~/.vim/gviminfo
    set columns=110
    set lines=40
"    behave mswin
endif

"键盘映射
"更方便的返回normal
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
inoremap kj <ESC>
inoremap <C-v> <C-r>+
"inoremap <C-u> <Esc>ui

nnoremap <F2> :update<CR><esc>
inoremap <F2> <esc>:update<CR><esc>
vnoremap <F2> <C-C>:update<CR><esc>
noremap <F3> <esc>:bn<CR>
noremap <F4> <esc>:call CloseBuffer()<CR>
inoremap <F4> <esc>:call CloseBuffer()<CR>
nnoremap <space> <c-f>

" 缩小undo颗粒度
" <c-g>u作用是在插入模式下，插入undo的分界点
" inoremap <CR> <c-g>u<esc>o
" CR的映射和supertab有冲突，直接在supertab.vim中插入了<c-g>u的代码
" 具体为第960行和第962行
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" 一些自动命令
" 打开文件时，自动定位到上次修改的地方
au BufReadPost * normal! `" 

" 载入其它配置, ~/.vim/vimrc/*.vim
runtime! vimrc/*.vim
