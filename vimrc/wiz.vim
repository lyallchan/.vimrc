
" wiz记笔记支持
" last modify date: 2014-07-06 20:51 
" author: lyallchan
"

" 1. 增加对todolist功能支持，F5:todo -> finish todo -> delete mark
nnoremap <F5> :call ToggleToDo()<CR>
vnoremap <F5> :call ToggleToDo()<CR>gv

" 2. 插入当前时间
inoremap zsj # <c-r>=strftime("20%y-%m-%d %H:%M")<CR> 
nmap zsj izsj

" 3. 对vim-markdown设定
let g:vim_markdown_folding_disabled=1

" 4. alt-j：下移一行，alt-k：上移一行，支持visual mode
nnoremap <M-j> :m.+1<CR>  
nnoremap <M-k> :m.-2<CR>
vnoremap <M-j> :m'>+1<CR>gv
vnoremap <M-k> :m'<-2<CR>gv

" 5. 行首插入序号
vnoremap <F6> :g/^\s*/ s//\=submatch(0).(line(".")-line("'<")+1).'. '<CR>
nnoremap <F6> :s/^\s*/\=submatch(0).Seqno().'. '/<CR>
noremap <leader><F6> :let b:seq=0<CR>

" 6. markdown表格支持
noremap <F7> :s/^\s*\\|\s*$\\|\s\+/ \| /g<CR>
vnoremap <s-f7> :s/\%V \| \\| \|$\%V/   /g<CR>
nnoremap <s-f7> :s/ \| \\| \|$/   /g<CR>

function Seqno()
    let b:seq = exists("b:seq")?b:seq+1:1
    return b:seq
endfunction

function ToggleToDo()

    let a=[' `[TODO]` ',' `[FINISH]` ']
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

