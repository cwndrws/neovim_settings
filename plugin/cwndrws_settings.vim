if exists('g:loaded_cwndrws_settings') | finish | endif " prevent loading file twice

let s:save_cpo = &cpo " save user coptions
set cpo&vim " reset them to defaults

" command to run our plugin
lua require 'cwndrws_settings'.setup()

let &cpo = s:save_cpo " and restore after
unlet s:save_cpo

let g:loaded_cwndrws_settings = 1
