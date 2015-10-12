
if has("gui") && has("mac")
    colorscheme zellner
    set guifont=Monaco:h14
endif
if has("win32")
"    source $VIMRUNTIME/vimrc_example.vim
"    source $VIMRUNTIME/mswin.vim
"    gvim��vim on cygwin����.vim�ļ���
    set rtp+=$HOME/.vim/after
    set columns=100
    set lines=30
    autocmd! guienter * winpos 66 80
    set guioptions-=m "�˵�"
    set guioptions-=T "������"
    set guioptions-=r "�ұ߹�����"
    set guioptions+=c "��ʹ�öԻ���"
    let w:full_screen=0
    nnoremap <F11> :call other#FullScreen()<CR>
    inoremap <F11> <esc>:call other#FullScreen()<CR>i
    nnoremap <M-enter> :call other#FullScreen()<CR>
    inoremap <M-enter> <esc>:call other#FullScreen()<CR>i
endif

" bundle support
let g:pathogen_blacklist=["easymotion","undotree"] "���б��еĲ�����ᱻ����"
filetype off
execute pathogen#infect()
call pathogen#helptags()

"����֧��
"set guifont=consolas:cGB2312:h11
"set fileencoding=chinese
set encoding=utf-8
if has("win32")
    set encoding=chinese
endif
set ambiwidth=double
set helplang=cn
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set formatoptions+=tcrqvmMB "��ȷ������������

"����֧��
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

"һ���趨
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
set clipboard=unnamed   "ʹ��ϵͳ��������ΪVIM��Ĭ�ϼĴ�������������VIM�ͱ�ĳ��򽻻�����
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

"����ӳ��
"������ķ���normal
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
inoremap kj <ESC>
inoremap <C-v> <C-r>+
onoremap a 0
onoremap e $

"ʹ��tab��������%����ƥ����ת
nmap <tab> %
vmap <tab> %

" buffer��ת
nnoremap <leader>w <c-w>w

nnoremap <F2> :update<CR><esc>
inoremap <F2> <esc>:update<CR><esc>
vnoremap <F2> <C-C>:update<CR><esc>
noremap <F3> <esc>:bn<CR>
noremap <F4> <esc>:call CloseBuffer()<CR>
inoremap <F4> <esc>:call CloseBuffer()<CR>
nnoremap <space> <c-f>

"ģ��emacs�µ�<c-a>��<c-e>,����ģʽ�µ�<c-n><c-p>
inoremap <c-a> <esc>I
nnoremap <c-a> 0
vnoremap <c-a> 0
inoremap <c-e> <esc>A
nnoremap <c-e> $
vnoremap <c-e> $
inoremap <c-n> <down>
inoremap <c-p> <up>

" ��Сundo������
" <c-g>u�������ڲ���ģʽ�£�����undo�ķֽ��
" CR��ӳ���supertab�г�ͻ��ֱ����supertab.vim�в�����<c-g>u�Ĵ���
" ����Ϊ��960�к͵�962��
inoremap <CR> <c-g>u<esc>o
inoremap <space> <c-g>u<space>
inoremap . <c-g>u.
inoremap , <c-g>u,
inoremap ! <c-g>u!
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" һЩ�Զ�����
" ���ļ�ʱ���Զ���λ���ϴ��޸ĵĵط�
au BufReadPost * normal! `" 

"�Զ����������ļ�����Ҫ����
autocmd! bufwritepost .vimrc source %

" ������������, ~/.vim/vimrc/*.vim
runtime! vimrc/*.vim
