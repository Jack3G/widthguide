if exists('g:loaded_widthguide') | finish | endif " prevent loading file twice

let s:save_cpo = &cpo " save user coptions
set cpo&vim " reset them to defaults

command! WidthGuideEnable lua require("widthguide").enable()
command! WidthGuideDisable lua require("widthguide").disable()

let &cpo = s:save_cpo " and restore after
unlet s:save_cpo

let g:loaded_widthguide = 1
