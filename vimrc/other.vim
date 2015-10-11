
set diffexpr=MyDiff()
function! MyDiff()
 let opt = '-a --binary '
 if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
 if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
 let arg1 = v:fname_in
 if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
 let arg2 = v:fname_new
 if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
 let arg3 = v:fname_out
 if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
 if $VIMRUNTIME =~ ' '
 let eq = ''
   if &sh =~ '\<cmd'
     let cmd = '""' . $VIMRUNTIME . '\diff"'
     let eq = '"'
   else
     let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
   endif
 else
   let cmd = $VIMRUNTIME . '\diff'
 endif
 silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

function! CloseBuffer()
	""�رյ�ǰbuffer����������һ��buffer����ر�����vim
	if buflisted(bufnr("")) && tabpagenr("$")==1 "����ǿ�list��buffer��˵��������buffer
		let currentbuffer=bufnr("$") "��ȡ���һ��buffer���
		 "�رյ�ǰbuffer
		exe ":bd"
		if bufnr("")>=currentbuffer "��������һ��buffer����ر�����vim
			exe "q"
		endif
	else "��������buffer��������helpbuffer���Ǿͼ򵥵Ĺر�
		exe ":bd"
	endif
endfunction

function! RunScript()
    "���е�ǰ��Python����
    "��һ���ǳ���Ĳ�����������#:args:��ͷ������֮���ÿո����
    "��������������ݼ�<F5>
python << EOF
import vim
import sys
sys.argv = vim.current.buffer[0].split(":")
#����в����б���Ҳ����б�ĵ�һ�����ǿ��ַ���
sys.argv = [s.strip() for s in sys.argv]  #ȥ��ǰ��Ŀո�
if len(sys.argv)>=3:
    sys.argv = sys.argv[2].split()
    if sys.argv[0] <> '':
        sys.argv = [''] + sys.argv
    else:
        sys.argv = []
else:
    sys.argv = []
EOF
    pyfile %
endfunction

function! ShowAddress()

    "personal.address;"��������ʱ�ļ���Ȼ����VIM��ȡ�����ʱ�ļ���������ʾ
    "ִ��DOS���mysql -hlocalhost -uroot -p123456 -e"select * from
    "personal.address;"��������ʱ�ļ���Ȼ����VIM��ȡ�����ʱ�ļ���������ʾ

    "ִ��DOS���mysql -hlocalhost -uroot -p123456 -e"select * from

    let mysqlcmd = 'mysql -hlocalhost -uroot -p123456 -e"select * from personal.address;" -t '
    if has("win32")
        let address = '"c:\address.txt"'
        let address0 = 'c:\address.txt'
    endif

    if has("unix")
        let address = '/cygdrive/c/Documents\ and\ Settings/zqqian/My\ Documents/�ͻ���Ӧ����/ͨ��¼/address.txt'
        let address0 = '/cygdrive/c/Documents\ and\ Settings/zqqian/My\ Documents/�ͻ���Ӧ����/ͨ��¼/address.txt'
    endif
    silent exe '!' .  mysqlcmd . '> ' . address
    exe 'hide e ' . address0
endfunction

function! ToggleComment(g)
        if stridx(getline('.'),a:g) == 0
            call setline('.',getline('.')[2:strlen(getline('.'))])
        else
            call setline('.',a:g.getline('.'))
        endif
endfunction

function! other#FullScreen()
    if w:full_screen==1
        let w:full_screen=0
        :simalt ~R
    else
        :simalt ~X
        let w:full_screen=1
    endif
endfunction
