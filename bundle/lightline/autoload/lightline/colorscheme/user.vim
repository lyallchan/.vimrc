" =============================================================================
" Filename: autoload/lightline/colorscheme/landscape.vim
" Author: itchyny
" License: MIT License
" Last Change: 2013/09/07 12:26:11.
" =============================================================================

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ ['#303030', '#585858', 255, 245]]
let s:p.normal.right= s:p.normal.left 
let s:p.normal.middle= s:p.normal.left 
let s:p.inactive.right = s:p.normal.left 
let s:p.inactive.left = s:p.normal.left 
let s:p.insert.left =  s:p.normal.left 
let s:p.replace.left =s:p.normal.left 
let s:p.visual.left =s:p.normal.left 
let s:p.inactive.middle = s:p.normal.left 
let s:p.tabline.left =s:p.normal.left 
let s:p.tabline.tabsel = s:p.normal.left 
let s:p.tabline.middle =s:p.normal.left 
let s:p.tabline.right =s:p.normal.left 
let s:p.normal.error =s:p.normal.left 
let s:p.normal.warning = s:p.normal.left 

let g:lightline#colorscheme#user#palette = s:p
