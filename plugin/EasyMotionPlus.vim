" EasyMotionPlus - Vim motions on speed!
"
" Author: Kim Silkebækken <kim.silkebaekken+vim@gmail.com>
" Source repository: https://github.com/Lokaltog/vim-easymotion

" Script initialization {{{
	if exists('g:EasyMotionPlus_loaded') || &compatible || version < 702
		finish
	endif

	let g:EasyMotionPlus_loaded = 1
" }}}
" Default configuration {{{
	" Default options {{{
		call EasyMotionPlus#InitOptions({
		\   'leader_key'      : '<Leader><Leader>'
		\ , 'keys'            : 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
		\ , 'do_shade'        : 1
		\ , 'do_mapping'      : 1
		\ , 'grouping'        : 1
		\
		\ , 'hl_group_target' : 'EasyMotionPlusTarget'
		\ , 'hl_group_shade'  : 'EasyMotionPlusShade'
		\ })
	" }}}
	" Default highlighting {{{
		let s:target_hl_defaults = {
		\   'gui'     : ['NONE', '#ff0000' , 'bold']
		\ , 'cterm256': ['NONE', '196'     , 'bold']
		\ , 'cterm'   : ['NONE', 'red'     , 'bold']
		\ }

		let s:shade_hl_defaults = {
		\   'gui'     : ['NONE', '#777777' , 'NONE']
		\ , 'cterm256': ['NONE', '242'     , 'NONE']
		\ , 'cterm'   : ['NONE', 'grey'    , 'NONE']
		\ }

		call EasyMotionPlus#InitHL(g:EasyMotionPlus_hl_group_target, s:target_hl_defaults)
		call EasyMotionPlus#InitHL(g:EasyMotionPlus_hl_group_shade,  s:shade_hl_defaults)

		" Reset highlighting after loading a new color scheme {{{
			augroup EasyMotionPlusInitHL
				autocmd!

				autocmd ColorScheme * call EasyMotionPlus#InitHL(g:EasyMotionPlus_hl_group_target, s:target_hl_defaults)
				autocmd ColorScheme * call EasyMotionPlus#InitHL(g:EasyMotionPlus_hl_group_shade,  s:shade_hl_defaults)
			augroup end
		" }}}
	" }}}
	" Default key mapping {{{
		call EasyMotionPlus#InitMappings({
		\   'f' : { 'name': 'F'  , 'dir': 0 }
		\ , 'F' : { 'name': 'F'  , 'dir': 1 }
		\ , 't' : { 'name': 'T'  , 'dir': 0 }
		\ , 'T' : { 'name': 'T'  , 'dir': 1 }
		\ , 'w' : { 'name': 'WB' , 'dir': 0 }
		\ , 'W' : { 'name': 'WBW', 'dir': 0 }
		\ , 'b' : { 'name': 'WB' , 'dir': 1 }
		\ , 'B' : { 'name': 'WBW', 'dir': 1 }
        \ , 'lw': { 'name': 'WB' , 'dir': 2 }
        \ , 'lW': { 'name': 'WBW', 'dir': 2 }
        \ , 'le': { 'name': 'E'  , 'dir': 2 }
        \ , 'lE': { 'name': 'EW' , 'dir': 2 }
		\ , 'e' : { 'name': 'E'  , 'dir': 0 }
		\ , 'E' : { 'name': 'EW' , 'dir': 0 }
		\ , 'ge': { 'name': 'E'  , 'dir': 1 }
		\ , 'gE': { 'name': 'EW' , 'dir': 1 }
		\ , 'j' : { 'name': 'JK' , 'dir': 0 }
		\ , 'k' : { 'name': 'JK' , 'dir': 1 }
		\ , 'n' : { 'name': 'Search' , 'dir': 0 }
		\ , 'N' : { 'name': 'Search' , 'dir': 1 }
		\ })
	" }}}
" }}}

" vim: fdm=marker:noet:ts=4:sw=4:sts=4
