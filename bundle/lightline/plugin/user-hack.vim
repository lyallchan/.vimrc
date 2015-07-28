let g:lightline = {
      \ 'colorscheme': 'user',
      \ 'active': {
      \   'left': [ 
      \             [ 'filename', 'modified', 'readonly' ],
      \             [ 'fugitive' ]
      \           ],
      \  'right': [ 
      \             [ 'time' ],
      \             [ 'lineinfo' ], 
      \             [ 'percent' ], 
      \             [ 'fileencoding' ]
      \           ] 
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
      \   'time': '%{strftime("(%H:%M)")}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }
set t_Co=256
if has("gui")
    let g:lightline.colorscheme = 'user_gui'
endif
