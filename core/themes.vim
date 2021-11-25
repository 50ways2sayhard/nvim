let s:theme_setup_dict = {}

function! s:theme_setup_dict.doom_one() dict abort
  colorscheme doom-one
endfunction


" Theme to directory name mapping, because theme repo name is not necessarily
" the same as the theme name itself.
let s:theme2dir = {
      \ 'doom_one': 'doom-one.nvim',
      \ }

let s:theme = utils#RandElement(keys(s:theme2dir))
let s:colorscheme_func = printf('s:theme_setup_dict.%s()', s:theme)

if !has_key(s:theme_setup_dict, s:theme)
  let s:msg = "Invalid colorscheme function: " . s:colorscheme_func
  call v:lua.vim.notify(s:msg, 'error', {'title': 'nvim-config'})
  finish
endif

let s:res = utils#add_pack(s:theme2dir[s:theme])
if !s:res
  echomsg printf("Theme %s not installed. Run PackerSync to install.", s:theme)
  finish
endif

execute 'call ' . s:colorscheme_func
if g:logging_level == 'debug'
  let s:msg1 = "Currently loaded theme: " . s:theme
  call v:lua.vim.notify(s:msg1, 'info', {'title': 'nvim-config'})
endif
