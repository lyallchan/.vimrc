
"����֧��
"set guifont=consolas:cGB2312:h11
"set fileencoding=chinese

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

"�Զ�������
"command ContactShow call ShowAddress()
"command CS call ShowAddress()

"MySQL ���ݿ�֧��
"let g:dbext_default_profile='mySQLServer'
"let g:dbext_default_profile_mySQLServer = 'type=mysql:user=root:passwd=123456:dbname=personal:host=localhost:port=3306:extra=-t'

"filetype֧��
"����python�ֵ䣬���������Ŀ¼�µ�readme�ļ�
"autocmd FileType python set complete+=kC:\\Python26\\pydiction\\pydiction isk+=.,
"������tab�����ÿո���棬����������ӦΪ4���ո�
"autocmd FileType python setlocal et sta sw=4 sts=4
"autocmd FileType python set commentstring=#%s
"��txt�ļ����͵��Զ�ʶ��
"au BufRead,BufNewFile *.txt setf txt
"
