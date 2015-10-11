
" wiz�Ǳʼ�֧��
" last modify date: 2014-07-06 20:51 
" author: lyallchan
"

" 1. ���Ӷ�todolist����֧�֣�F5:todo -> finish todo -> delete mark
nnoremap <F5> :call <SID>ToggleToDo()<CR>
vnoremap <F5> :call <SID>ToggleToDo()<CR>gv

" 2. ���뵱ǰʱ��
inoremap zsj # <c-r>=strftime("20%y-%m-%d %H:%M")<CR> 
nmap zsj Ozsj

" 3. ��vim-markdown�趨
let g:vim_markdown_folding_disabled=1

" 4. alt-j������һ�У�alt-k������һ�У�֧��visual mode
nnoremap <M-j> :m.+1<CR>  
nnoremap <M-k> :m.-2<CR>
vnoremap <M-j> :m'>+1<CR>gv
vnoremap <M-k> :m'<-2<CR>gv

" 5. ���ײ�����ţ�����operatorΪF6��֧��ѡ��F6��{count}F6��F6{motion}
vnoremap <F6> :g/^\s*/ s//\=submatch(0).(line(".")-line("'<")+1).'. '<CR>
nnoremap <expr><F6> <SID>exeSeqno()

" 6. markdown���֧��
" ����ʹ�ã���[table-mode](http://lyallchan.github.io/index.html?name=%E4%BD%BF%E7%94%A8vim%E7%94%BB%E8%A1%A8%E6%A0%BC)�������
" noremap <F7> :s/^\s*\\|\s*$\\|\s\+/ \| /g<CR>
" vnoremap <s-f7> :s/\%V \| \\| \|$\%V/   /g<CR>
" nnoremap <s-f7> :s/ \| \\| \|$/   /g<CR>

function! s:Seqno(type,...)
    " ���к�
    " �û�����{count}operator{motion}����ʽ
    " �������õķ�Χ��{count}*{motion}��
    " '[ ��ʼ��
    " '] ������
    " ���� 2d3j���������÷�Χ��2*3=6��6��
    " '[ ��ʾ��ǰ��
    " '] ��ʾ��ǰ��+5
    let i = line("'[")
    let j = line("']")
    for l in range(i,j)
        execute l."s/^\\s*/\\0".(l-i+1).'. '
    endfor
endfunction

function! s:exeSeqno()
    "��ȡSID
    let s:sid=matchstr(expand('<sfile>'), '<SNR>\d\+_')

    "opfuncָ��<SID>Seqno
    execute "set operatorfunc=".s:sid."Seqno"

    "�ж���operatorǰ�Ƿ���{count}��
    "����У���v:count��Ϊ0����������g@��ֱ��ִ��Seqno��
    "���û�У���v:countΪ0������һ��g@���ȴ��û�����motion����ִ��Seqno
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

