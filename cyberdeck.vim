" Name:       cyberdeck.vim
" Version:    0.1.0
" Maintainer: github.com/jgplane
" License:    The MIT License (MIT)
" Terminal only colorscheme
"""

hi clear

if exists('syntax on')
  syntax reset
endif

let g:colors_name='cyberdeck'

let s:background = &background

" =============================================================================
" VARIABLES
" =============================================================================

" GRAYSCALE
" only for setting named variables
"""
let s:white           = "231"
let s:black           = "232"

" dark < light
for i in range(232,255)
  let s:gray_{i} = string(i)
endfor


if &background == "dark"
  let s:bg              = s:gray_235
  let s:bg_alt          = s:gray_236
  let s:bg_subtle       = s:gray_239
else
  " there is no light mode
  " you are only controlling contrast
  let s:bg              = s:gray_236
  let s:bg_alt          = s:gray_237
  let s:bg_subtle       = s:gray_239
endif

" COLOR
" only for setting named variables
"""

let s:burning_chrome  = "81"
let s:millions_purple = "183"
let s:flatline_red    = "210"
let s:straylight_gold = "221"
let s:gibson_green    = "85"

let s:norm            = s:gray_255
let s:norm_opposite   = s:black
let s:norm_subtle     = s:gray_249
let s:comment         = s:gray_241
let s:accent          = s:gray_250

let s:primary         = s:millions_purple
let s:secondary       = s:burning_chrome
let s:tertiary        = s:straylight_gold
let s:quaternary      = s:flatline_red
let s:quinary         = s:gibson_green
let s:visual          = s:straylight_gold

let s:success         = s:gibson_green
let s:error           = s:flatline_red

" =============================================================================
" HIGHLIGHT IT
" =============================================================================

" https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  execute "highlight" a:group
    \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg : "NONE")
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

call s:h("Normal",        {"bg": s:bg, "fg": s:norm})

" restore &background's value in case changing Normal changed &background (:help :hi-normal-cterm)
if &background != s:background
   execute "set background=" . s:background
endif

call s:h("Cursor",        {"bg": s:norm, "fg": s:norm_opposite})

call s:h("Comment",       {"fg": s:comment})
call s:h("Constant",      {"fg": s:norm})
hi! link character        constant
hi! link number           constant
hi! link Boolean          Constant
hi! link Float            Constant
hi! link String           Constant

hi! link Identifier       Normal
hi! link Function         Identifier

call s:h("Statement",     {"fg": s:secondary})
hi! link Conditonal       Statement
hi! link Repeat           Statement
hi! link Label            Statement
hi! link Keyword          Statement
hi! link Exception        Statement

call s:h("Operator",      {"fg": s:norm, "cterm": "bold"})

call s:h("PreProc",     {"fg": s:primary})
hi! link Include          PreProc
hi! link Define           PreProc
hi! link Macro            PreProc
hi! link PreCondit        PreProc

call s:h("Type",          {"fg": s:norm})
hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type

call s:h("Special",       {"fg": s:norm_subtle})
hi! link SpecialChar      Special
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special

call s:h("User1",  {"bg": s:bg_alt})

call s:h("Underlined",    {"fg": s:norm, "cterm": "underline"})
call s:h("Ignore",        {"fg": s:bg})
call s:h("Error",         {"fg": s:norm, "bg": s:error, "cterm": "bold"})
call s:h("Todo",          {"fg": s:primary, "cterm": "underline"})
call s:h("SpecialKey",    {"fg": s:error})
call s:h("NonText",       {"fg": s:norm_subtle})
call s:h("Directory",     {"fg": s:primary})
call s:h("ErrorMsg",      {"fg": s:error})
call s:h("IncSearch",     {"bg": s:primary, "fg": s:bg})
call s:h("Search",        {"bg": s:primary, "fg": s:bg})
call s:h("MoreMsg",       {"fg": s:norm_subtle, "cterm": "bold"})
hi! link ModeMsg MoreMsg
call s:h("LineNr",        {"fg": s:bg_subtle, "bg": s:bg})
call s:h("CursorLineNr",  {"fg": s:tertiary, "bg": s:bg_alt})
call s:h("Question",      {"fg": s:norm_subtle})
call s:h("StatusLine",    {"bg": s:bg_alt})
call s:h("StatusLineNC",  {"bg": s:bg_alt, "fg": s:bg_alt})
call s:h("StatusLineTerm",    {"bg": s:tertiary, "fg": s:bg_alt})
call s:h("StatusLineTermNC",  {"bg": s:tertiary, "fg": s:bg_alt})
call s:h("VertSplit",     {"bg": s:bg_alt, "fg": s:bg_alt})
call s:h("Title",         {"fg": s:primary})
call s:h("Visual",        {"fg": s:norm_opposite, "bg": s:visual})
call s:h("VisualNOS",     {"bg": s:bg_subtle})
call s:h("WarningMsg",    {"fg": s:norm_subtle})
call s:h("WildMenu",      {"fg": s:bg, "bg": s:norm})
call s:h("Folded",        {"fg": s:norm_subtle})
call s:h("FoldColumn",    {"fg": s:bg_subtle})
call s:h("DiffAdd",       {"fg": s:success})
call s:h("DiffDelete",    {"fg": s:error})
call s:h("DiffChange",    {"fg": s:primary})
call s:h("DiffText",      {"fg": s:primary})
call s:h("SignColumn",    {"fg": s:accent})
call s:h("Pmenu",         {"fg": s:norm, "bg": s:bg_subtle})
call s:h("PmenuSel",      {"fg": s:bg_subtle, "bg": s:primary})
call s:h("PmenuSbar",     {"fg": s:norm, "bg": s:bg_subtle})
call s:h("PmenuThumb",    {"fg": s:norm, "bg": s:bg_subtle})
call s:h("TabLine",       {"fg": s:norm, "bg": s:bg_alt})
call s:h("TabLineSel",    {"fg": s:primary, "bg": s:bg_subtle, "cterm": "bold"})
call s:h("TabLineFill",   {"fg": s:norm, "bg": s:bg_alt})
call s:h("CursorColumn",  {"bg": s:bg_alt})
call s:h("CursorLine",    {})
call s:h("ColorColumn",   {"bg": s:bg_subtle})
call s:h("MatchParen",    {"bg": s:bg_subtle, "fg": s:norm})
call s:h("qfLineNr",      {"fg": s:norm_subtle})

" NETRW
call s:h("netrwTreeBar",      {"fg": s:comment, "cterm": "bold"})
call s:h("netrwPlain",        {"fg": s:norm})
call s:h("netrwClassify",     {"fg": s:norm_subtle, "cterm": "bold"})
call s:h("netrwDir",          {"fg": s:norm_subtle})
call s:h("netrwTreeBarSpace", {"fg": s:norm_subtle, "cterm": "bold"})
call s:h("netrwExe",          {"fg": s:primary, "cterm": "bold"})

" HTML
call s:h("htmlH1",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH2",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH3",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH4",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH5",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH6",        {"bg": s:bg, "fg": s:norm})

" RUBY
call s:h("rubyClass",            {"fg": s:primary})
hi! link rubyDefine        rubyClass
hi! link rubyMacro         rubyClass
hi! link rubyMethodBlock   Normal

call s:h("rubyClassName",        {"fg": s:tertiary})
hi! link rubyConstant    rubyClassName
hi! link rubyMethodName  rubyClassName

hi! link rubyKeywordAsMethod Normal

hi! link rubyConditional           rubyClass
hi! link rubyConditionalModifier   rubyClass

call s:h("rubyInstanceVariable", {"fg": s:secondary})
call s:h("rubyString",           {"fg": s:norm})
call s:h("rubyBlock",            {"fg": s:tertiary})
call s:h("rubyDoBlock",          {"fg": s:quinary})
call s:h("rubySymbol",           {"fg": s:quaternary})

" MARKDOWN
call s:h("VimwikiCode",     {"fg": s:norm_subtle})
call s:h("VimwikiPre",      {"fg": s:norm_subtle})
call s:h("VimwikiListTodo", {"fg": s:norm_subtle})

" SNAP
call s:h("SnapTitleNorm",      {"fg": s:norm_opposite, "bg": s:norm})
call s:h("SnapTextTodo",       {"fg": s:norm_opposite, "bg": s:norm_subtle})
call s:h("SnapTextDone",      {"fg": s:norm_opposite, "bg": s:bg_subtle})
hi! link SnapTextStart   SnapTextDone
hi! link SnapTextTrail   SnapTextDone
hi! link SnapTextHead    SnapTextDone
call s:h("SnapTitleBang",      {"fg": s:norm_opposite, "bg": s:error})

