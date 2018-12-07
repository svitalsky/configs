" Syntax highlighting for outliner.
" Maintainer: Ned Konz <vim@bike-nomad.com>
" $Id: otl.vim,v 1.19 2002/12/21 03:17:43 ned Exp $

syn match otlText /^\t*|.*/               contains=otlTodo,otlTagDef,otlTagRef,otlTextLeader display nextgroup=otlText
syn match otlTab9 /^\t\{9}[^\t|].*/       contains=otlTodo,otlTagDef,otlTagRef display nextgroup=otlTab9,otlTab8,otlText
syn match otlTab8 /^\t\{8}[^\t|].*/       contains=otlTodo,otlTagDef,otlTagRef display nextgroup=otlTab8,otlTab9,otlTab7,otlText
syn match otlTab7 /^\t\{7}[^\t|].*/       contains=otlTodo,otlTagDef,otlTagRef display nextgroup=otlTab7,otlTab8,otlTab6,otlText
syn match otlTab6 /^\t\{6}[^\t|].*/       contains=otlTodo,otlTagDef,otlTagRef display nextgroup=otlTab6,otlTab7,otlTab5,otlText
syn match otlTab5 /^\t\{5}[^\t|].*/       contains=otlTodo,otlTagDef,otlTagRef display nextgroup=otlTab5,otlTab6,otlTab4,otlText
syn match otlTab4 /^\t\{4}[^\t|].*/       contains=otlTodo,otlTagDef,otlTagRef display nextgroup=otlTab4,otlTab5,otlTab3,otlText
syn match otlTab3 /^\t\{3}[^\t|].*/       contains=otlTodo,otlTagDef,otlTagRef display nextgroup=otlTab3,otlTab4,otlTab2,otlText
syn match otlTab2 /^\t\{2}[^\t|].*/       contains=otlTodo,otlTagDef,otlTagRef display nextgroup=otlTab2,otlTab3,otlTab1,otlText
syn match otlTab1 /^\t\{1}[^\t|].*/       contains=otlTodo,otlTagDef,otlTagRef display nextgroup=otlTab1,otlTab2,otlTab0,otlText
syn match otlTab0 /^[^\t|].*/             contains=otlTodo,otlTagDef,otlTagRef display nextgroup=otlTab0,otlTab1,otlText
syn match otlTodo /\<\(TODO\|XXX\|NOTE\|LATER\|FUCK\|DONE\|RESOLVED\)\>/    contained
" syn match otlTagRef  /\[[^]]*]/              contained
syn match otlTagRef  /<[Uu][Rr][Ll]:[^>]\+>\|\[[^]]*]/              contained
" syn match otlTagDef  /\[\[[^]]*]]/              contained
syn match otlTagDef  /\<[Ii][Dd]=\w\+\|\[\[[^]]*]]/              contained
syn match otlTextLeader /^\t*|/   contained

if &background == "dark"
" hi def otlLeadingSpaces ctermbg=darkred guibg=#500000
  hi link otlTodo Todo
  hi def otlTagRef ctermbg=3 ctermfg=4 cterm=bold guibg=#081808
  hi def otlTagDef ctermbg=3 ctermfg=4 cterm=bold guibg=#081808
  hi def otlTextLeader guifg=darkgrey ctermfg=7
"   hi link otlText Comment
else
" hi def otlLeadingSpaces ctermbg=lightred guibg=#ffdddd
"   hi def otlTodo ctermbg=3 guibg=lightyellow
  hi link otlTodo Todo
  hi def otlTagRef ctermbg=3 ctermfg=4 cterm=bold guibg=lightblue
  hi def otlTagDef ctermbg=3 ctermfg=4 cterm=bold guibg=lightgreen
  hi def otlTextLeader guifg=darkgrey ctermfg=7
endif

" Default is to have bold headers
if !exists("g:otl_bold_headers")
  let g:otl_bold_headers = 1
endif

if g:otl_bold_headers
  hi def otlTab0 ctermfg=1 cterm=bold gui=bold guifg=red term=reverse
  hi def otlTab1 ctermfg=4 cterm=bold gui=bold guifg=#7f0055 term=reverse
  hi def otlTab2 ctermfg=2 cterm=bold gui=bold guifg=#7f0055 term=reverse
  hi def otlTab3 ctermfg=3 cterm=bold gui=bold guifg=#7f0055 term=reverse
  hi def otlTab4 ctermfg=5 cterm=bold gui=bold guifg=#7f0055 term=reverse
  hi def otlTab5 ctermfg=6 cterm=bold gui=bold guifg=#7f0055 term=reverse
  hi def otlTab6 ctermfg=1 cterm=bold gui=bold guifg=#7f0055 term=reverse
  hi def otlTab7 ctermfg=4 cterm=bold gui=bold guifg=#7f0055 term=reverse
  hi def otlTab8 ctermfg=2 cterm=bold gui=bold guifg=#7f0055 term=reverse
  hi def otlTab9 ctermfg=3 cterm=bold gui=bold guifg=#7f0055 term=reverse
else
  hi def otlTab0 ctermfg=1 cterm=NONE guifg=red
  hi def otlTab1 ctermfg=4 cterm=NONE guifg=#7f0055
  hi def otlTab2 ctermfg=2 cterm=NONE guifg=#7f0055
  hi def otlTab3 ctermfg=3 cterm=NONE guifg=#7f0055
  hi def otlTab4 ctermfg=5 cterm=NONE guifg=#7f0055
  hi def otlTab5 ctermfg=6 cterm=NONE guifg=#7f0055
  hi def otlTab6 ctermfg=1 cterm=NONE guifg=#7f0055
  hi def otlTab7 ctermfg=4 cterm=NONE guifg=#7f0055
  hi def otlTab8 ctermfg=2 cterm=NONE guifg=#7f0055
  hi def otlTab9 ctermfg=3 cterm=NONE guifg=#7f0055
endif

hi link otlTodo Todo

" vim: ts=2 sw=2 et
