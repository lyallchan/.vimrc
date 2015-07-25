let g:lightline = {
      \ 'colorscheme': 'landscape',
      \ 'active': {
      \   'left': [ 
      \             [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] 
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
      \ 'separator': { 'left': '|', 'right': '|' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }
