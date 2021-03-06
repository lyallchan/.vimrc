
if has("gui") && has("mac")
    colorscheme zellner
    set guifont=Monaco:h14
endif
if has("win32")
"    source $VIMRUNTIME/vimrc_example.vim
"    source $VIMRUNTIME/mswin.vim
"    gvim和vim on cygwin共用.vim文件夹
    set rtp+=$HOME/.vim/after
    set columns=100
    set lines=30
    autocmd! guienter * winpos 66 80
    set guioptions-=m "菜单"
    set guioptions-=T "工具栏"
    set guioptions-=r "右边滚动条"
    set guioptions+=c "不使用对话框"
    let w:full_screen=0
    nnoremap <F11> :call other#FullScreen()<CR>
    inoremap <F11> <esc>:call other#FullScreen()<CR>i
    nnoremap <M-enter> :call other#FullScreen()<CR>
    inoremap <M-enter> <esc>:call other#FullScreen()<CR>i
endif

" bundle support
let g:pathogen_blacklist=["easymotion","undotree"] "在列表中的插件不会被加载"
filetype off
execute pathogen#infect()
call pathogen#helptags()

"中文支持
"set guifont=consolas:cGB2312:h11
"set fileencoding=chinese
set encoding=utf-8
if has("win32")
    set encoding=chinese
endif
set ambiwidth=double
set helplang=cn
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set formatoptions+=tcrqvmMB "正确处理中文折行

"程序支持
syntax enable 
syntax on
filetype on
filetype indent on
filetype plugin on
set smartindent
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set laststatus=2 "always show status line, ruler responses c-g only"

"一般设定
"set guioptions+=a
set mouse=a
let mapleader=","
set scrolloff=2
set sidescrolloff=10
set linespace=5
set number
set relativenumber
set numberwidth=6
set ignorecase smartcase
set noswapfile
set confirm
set clipboard=unnamed   "使用系统剪贴板做为VIM的默认寄存器，这样方便VIM和别的程序交换数据
set fileformat=unix
" set ruler		" show the cursor position all the time
set incsearch		" do incremental searching
set nobackup
set nocompatible
set foldmethod=marker
set nowrapscan
set hidden "no need saving file while switching to another buffer"
set wildmenu
set nowrap
set history=100		" keep 50 lines of command line history
set viminfo='100,n~/.vim/viminfo
if has("win32")
    set viminfo='100,n~/.vim/gviminfo
endif 
set showcmd		" display incomplete commands
set backspace=indent,eol,start
highlight CursorLineNr gui=none guifg=brown guibg=#d0d0d0 ctermfg=11 ctermbg=gray

"键盘映射
"更方便的返回normal
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
inoremap kj <ESC>
inoremap <C-v> <C-r>+
onoremap a 0
onoremap e $

"使用tab键来代替%进行匹配跳转
nmap <tab> %
vmap <tab> %

" buffer跳转
nnoremap <leader>w <c-w>w

nnoremap <F2> :update<CR><esc>
inoremap <F2> <esc>:update<CR><esc>
vnoremap <F2> <C-C>:update<CR><esc>
noremap <F3> <esc>:bn<CR>
noremap <F4> <esc>:call CloseBuffer()<CR>
inoremap <F4> <esc>:call CloseBuffer()<CR>
nnoremap <space> <c-f>

"模拟emacs下的<c-a>和<c-e>,插入模式下的<c-n><c-p>
inoremap <c-a> <esc>I
nnoremap <c-a> 0
vnoremap <c-a> 0
inoremap <c-e> <esc>A
nnoremap <c-e> $
vnoremap <c-e> $
inoremap <c-n> <down>
inoremap <c-p> <up>

" 缩小undo颗粒度
" <c-g>u作用是在插入模式下，插入undo的分界点
" CR的映射和supertab有冲突，直接在supertab.vim中插入了<c-g>u的代码
" 具体为第960行和第962行
inoremap <CR> <c-g>u<esc>o
inoremap <space> <c-g>u<space>
inoremap . <c-g>u.
inoremap , <c-g>u,
inoremap ! <c-g>u!
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" 一些自动命令
" 打开文件时，自动定位到上次修改的地方
au BufReadPost * normal! `" 

"自动载入配置文件不需要重启
autocmd! bufwritepost .vimrc source %

" 载入其它配置, ~/.vim/vimrc/*.vim
runtime! vimrc/*.vim
