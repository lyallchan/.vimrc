
if has("gui") && has("mac")
    colorscheme zellner
    set guifont=Monaco:h14
endif
if has("win32")
"    source $VIMRUNTIME/vimrc_example.vim
"    source $VIMRUNTIME/mswin.vim
"    gvim��vim on cygwin����.vim�ļ���
    set rtp+=$HOME/.vim
endif

" set undo dir and enable undo
if has("persistent_undo")
    set undodir='~/.vim/undodir/'
    set undofile
endif

" bundle support
execute pathogen#infect()

"һ���趨
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
set clipboard=unnamed   "ʹ��ϵͳ��������ΪVIM��Ĭ�ϼĴ�������������VIM�ͱ�ĳ��򽻻�����
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

"����ӳ��
"������ķ���normal
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

" ��Сundo������
" <c-g>u�������ڲ���ģʽ�£�����undo�ķֽ��
" inoremap <CR> <c-g>u<esc>o
" CR��ӳ���supertab�г�ͻ��ֱ����supertab.vim�в�����<c-g>u�Ĵ���
" ����Ϊ��960�к͵�962��
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" һЩ�Զ�����
" ���ļ�ʱ���Զ���λ���ϴ��޸ĵĵط�
au BufReadPost * normal! `" 

" ������������, ~/.vim/vimrc/*.vim
runtime! vimrc/*.vim
