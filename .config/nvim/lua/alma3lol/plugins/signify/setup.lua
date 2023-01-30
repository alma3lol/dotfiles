return function()
	-- Change these if you want
	vim.g.signify_sign_add               = '+'
	vim.g.signify_sign_delete            = '_'
	vim.g.signify_sign_delete_first_line = '‾'
	vim.g.signify_sign_change            = '~'

	-- I find the numbers disctracting
	vim.g.signify_sign_show_count = 0
	vim.g.signify_sign_show_text = 1

	-- If you like colors instead
	vim.cmd [[
highlight SignifySignAdd                  ctermbg=green                guibg=#00ff00
highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#ff0000
highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00
]]
end
