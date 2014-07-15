
"中文支持
"set guifont=consolas:cGB2312:h11
"set fileencoding=chinese

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

"自定义命令
"command ContactShow call ShowAddress()
"command CS call ShowAddress()

"MySQL 数据库支持
"let g:dbext_default_profile='mySQLServer'
"let g:dbext_default_profile_mySQLServer = 'type=mysql:user=root:passwd=123456:dbname=personal:host=localhost:port=3306:extra=-t'

"filetype支持
"加入python字典，具体见以下目录下的readme文件
"autocmd FileType python set complete+=kC:\\Python26\\pydiction\\pydiction isk+=.,
"不出现tab，而用空格代替，另外缩进量应为4个空格
"autocmd FileType python setlocal et sta sw=4 sts=4
"autocmd FileType python set commentstring=#%s
"对txt文件类型的自动识别
"au BufRead,BufNewFile *.txt setf txt
"
