
" wiz记笔记支持
" last modify date: 2014-07-06 20:51 
" author: lyallchan
"

" 1. 增加对todolist功能支持，F5:todo -> finish todo -> delete mark
nnoremap <F5> :call <SID>ToggleToDo()<CR>
vnoremap <F5> :call <SID>ToggleToDo()<CR>gv

" 2. 插入当前时间
inoremap zsj # <c-r>=strftime("20%y-%m-%d %H:%M")<CR> 
nmap zsj Ozsj

" 3. 对vim-markdown设定
let g:vim_markdown_folding_disabled=1

" 4. alt-j：下移一行，alt-k：上移一行，支持visual mode
nnoremap <M-j> :m.+1<CR>  
nnoremap <M-k> :m.-2<CR>
vnoremap <M-j> :m'>+1<CR>gv
vnoremap <M-k> :m'<-2<CR>gv

" 5. 行首插入序号，定义operator为F6，支持选中F6，{count}F6，F6{motion}
vnoremap <F6> :g/^\s*/ s//\=submatch(0).(line(".")-line("'<")+1).'. '<CR>
nnoremap <expr><F6> <SID>exeSeqno()

" 6. markdown表格支持
" 不再使用，用[table-mode](http://lyallchan.github.io/index.html?name=%E4%BD%BF%E7%94%A8vim%E7%94%BB%E8%A1%A8%E6%A0%BC)插件代替
" noremap <F7> :s/^\s*\\|\s*$\\|\s\+/ \| /g<CR>
" vnoremap <s-f7> :s/\%V \| \\| \|$\%V/   /g<CR>
" nnoremap <s-f7> :s/ \| \\| \|$/   /g<CR>

function! s:Seqno(type,...)
    " 加行号
    " 用户输入{count}operator{motion}的形式
    " 则函数作用的范围是{count}*{motion}，
    " '[ 起始行
    " '] 结束行
    " 比如 2d3j，函数作用范围是2*3=6，6行
    " '[ 表示当前行
    " '] 表示当前行+5
    let i = line("'[")
    let j = line("']")
    for l in range(i,j)
        execute l."s/^\\s*/\\0".(l-i+1).'. '
    endfor
endfunction

function! s:exeSeqno()
    "获取SID
    let s:sid=matchstr(expand('<sfile>'), '<SNR>\d\+_')

    "opfunc指向<SID>Seqno
    execute "set operatorfunc=".s:sid."Seqno"

    "判断在operator前是否有{count}，
    "如果有，则v:count不为0，返回两个g@，直接执行Seqno，
    "如果没有，则v:count为0，返回一个g@，等待用户输入motion，在执行Seqno
    if v:count is 0
        return 'g@'
    else
        return 'g@g@'
    endif
endfunction

function! s:ToggleToDo()

    let a=[' `[TODO]`',' `[FINISH]`']
    let a0=[]
    let a_length = len(a)

    for i in a
        call add(a0, match(getline('.'), "\\V".i."\\$"))
    endfor
    
    let change = 0

    for i in range(a_length)
        if a0[i] >= 0 
            if i < a_length-1
                exe "s/\\V" . a[i]."\\$" . "/" . a[i+1] 
            else
                exe "s/\\V" . a[a_length-1]."\\$" . "//"
            endif
            let change = 1
            break
        endif
    endfor

    if !change
        exe "s/" . "$" . "/" . a[0]
    endif

endfunction

