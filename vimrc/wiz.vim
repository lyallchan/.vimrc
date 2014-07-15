
" wiz�Ǳʼ�֧��
" last modify date: 2014-07-06 20:51 
" author: lyallchan
"

" 1. ���Ӷ�todolist����֧�֣�F5:todo -> finish todo -> delete mark
nnoremap <F5> :call ToggleToDo()<CR>
vnoremap <F5> :call ToggleToDo()<CR>gv

" 2. ���뵱ǰʱ��
inoremap zsj # <c-r>=strftime("20%y-%m-%d %H:%M")<CR> 
nmap zsj izsj

" 3. ��vim-markdown�趨
let g:vim_markdown_folding_disabled=1

" 4. alt-j������һ�У�alt-k������һ�У�֧��visual mode
nnoremap <M-j> :m.+1<CR>  
nnoremap <M-k> :m.-2<CR>
vnoremap <M-j> :m'>+1<CR>gv
vnoremap <M-k> :m'<-2<CR>gv

" 5. ���ײ������
vnoremap <F6> :g/^\s*/ s//\=submatch(0).(line(".")-line("'<")+1).'. '<CR>
nnoremap <F6> :s/^\s*/\=submatch(0).Seqno().'. '/<CR>
noremap <leader><F6> :let b:seq=0<CR>

" 6. markdown���֧��
noremap <F7> :s/^\s*\\|\s*$\\|\s\+/ \| /g<CR>
vnoremap <s-f7> :s/\%V \| \\| \|$\%V/   /g<CR>
nnoremap <s-f7> :s/ \| \\| \|$/   /g<CR>

function Seqno()
    let b:seq = exists("b:seq")?b:seq+1:1
    return b:seq
endfunction

function ToggleToDo()

    let a=[' `[TODO]` ',' `[TODOFINISH]` ',' `[TODOCONTINUE]` ']

    let a0 = match(getline('.'), "\\V".a[0]."\\$")
    let a1 = match(getline('.'), "\\V".a[1]."\\$")
    let a2 = match(getline('.'), "\\V".a[2]."\\$")

    if a0 >=0
        exe "s/\\V" . a[0]."\\$" . "/" . a[1]
    elseif a1 >=0
        exe "s/\\V" . a[1]."\\$" . "/" . a[2]
    elseif a2 >=0
        exe "s/\\V" . a[2]."\\$" . "//"
    elseif (a0 == -1) && (a1 == -1) && (a2 == -1)
        exe "s/" . "$" . "/" . a[0]
    endif

endfunction

