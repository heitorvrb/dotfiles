" ~/.config/nvim/syntax/mango.vim

if exists("b:current_syntax")
  finish
endif

" Comments
syn match mangoComment "#.*$"

" Keys before '='
syn match mangoKey "^[A-Za-z0-9_-]\+\ze="

" Directives
syn keyword mangoDirective bind mousebind axisbind exec source tagrule layerrule windowrule
syn keyword mangoDirective exec-once

" Layouts
syn keyword mangoLayout tile scroller monocle grid deck center_tile
syn keyword mangoLayout vertical_tile right_tile vertical_scroller
syn keyword mangoLayout vertical_grid vertical_deck dwindle fair vertical_fair

" Modifiers
syn keyword mangoModifier SUPER CTRL ALT SHIFT NONE

" Commands
syn keyword mangoCommand spawn
syn keyword mangoCommand reload_config quit killclient
syn keyword mangoCommand togglefullscreen togglefakefullscreen
syn keyword mangoCommand togglefloating toggleglobal toggleoverlay
syn keyword mangoCommand toggleoverview minimized restore_minimized
syn keyword mangoCommand switch_layout
syn keyword mangoCommand focusstack focusdir focusmon
syn keyword mangoCommand exchange_client
syn keyword mangoCommand view viewtoleft viewtoright
syn keyword mangoCommand viewtoleft_have_client viewtoright_have_client
syn keyword mangoCommand tagtoleft tagtoright
syn keyword mangoCommand tagmon
syn keyword mangoCommand tagsilent
syn keyword mangoCommand moveresize curmove curresize

" Numbers
syn match mangoNumber "\<\d\+\(\.\d\+\)\?\>"

" Booleans
syn match mangoBoolean "\<[01]\>"

" Environment variables
syn match mangoVariable "\$[A-Za-z_][A-Za-z0-9_]*"

" Paths
syn match mangoPath "\(\~/\|/\)\S*"

" Quoted strings
syn region mangoString start=+"+ skip=+\\"+ end=+"+

hi def link mangoComment   Comment
hi def link mangoKey       Identifier
hi def link mangoDirective Keyword
hi def link mangoLayout    Type
hi def link mangoModifier  Constant
hi def link mangoCommand   Statement
hi def link mangoNumber    Number
hi def link mangoBoolean   Boolean
hi def link mangoVariable  Identifier
hi def link mangoPath      String
hi def link mangoString    String

let b:current_syntax = "mango"
