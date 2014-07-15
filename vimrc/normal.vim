
set diffexpr=MyDiff()
function MyDiff()
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

function CloseBuffer()
	""关闭当前buffer，如果是最后一个buffer，则关闭整个vim
	if buflisted(bufnr("")) && tabpagenr("$")==1 "如果是可list的buffer，说明是正常buffer
		let currentbuffer=bufnr("$") "获取最后一个buffer编号
		 "关闭当前buffer
		exe ":bd"
		if bufnr("")>=currentbuffer "如果是最后一个buffer，则关闭整个vim
			exe "q"
		endif
	else "不是正常buffer，可能是helpbuffer，那就简单的关闭
		exe ":bd"
	endif
endfunction

function RunScript()
    "运行当前的Python程序
    "第一行是程序的参数，必须以#:args:开头，参数之间用空格相隔
    "这个函数被赋予快捷键<F5>
python << EOF
import vim
import sys
sys.argv = vim.current.buffer[0].split(":")
#如果有参数列表而且参数列表的第一个不是空字符串
sys.argv = [s.strip() for s in sys.argv]  #去掉前后的空格
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

function ShowAddress()

    "personal.address;"，生成临时文件，然后用VIM读取这个临时文件，用于显示
    "执行DOS命令，mysql -hlocalhost -uroot -p123456 -e"select * from
    "personal.address;"，生成临时文件，然后用VIM读取这个临时文件，用于显示

    "执行DOS命令，mysql -hlocalhost -uroot -p123456 -e"select * from

    let mysqlcmd = 'mysql -hlocalhost -uroot -p123456 -e"select * from personal.address;" -t '
    if has("win32")
        let address = '"c:\address.txt"'
        let address0 = 'c:\address.txt'
    endif

    if has("unix")
        let address = '/cygdrive/c/Documents\ and\ Settings/zqqian/My\ Documents/客户响应中心/通信录/address.txt'
        let address0 = '/cygdrive/c/Documents\ and\ Settings/zqqian/My\ Documents/客户响应中心/通信录/address.txt'
    endif
    silent exe '!' .  mysqlcmd . '> ' . address
    exe 'hide e ' . address0
endfunction

function ToggleComment(g)
        if stridx(getline('.'),a:g) == 0
            call setline('.',getline('.')[2:strlen(getline('.'))])
        else
            call setline('.',a:g.getline('.'))
        endif
endfunction
