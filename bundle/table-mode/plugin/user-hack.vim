let g:table_mode_corner = '|'
let g:table_mode_delimiter = ' '
let g:table_mode_border=0
let g:table_mode_fillchar='-'
if !hasmapto('<Plug>(table-mode-realign)')
  exec "nmap " . g:table_mode_map_prefix . "r <Plug>(table-mode-realign)"
endif

