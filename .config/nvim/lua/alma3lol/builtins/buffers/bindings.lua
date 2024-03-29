return function()
	vim.g.alma3lol.bindings.nnoremap("<leader>nw", "<cmd>noau w!<CR>")
	vim.g.alma3lol.bindings.nnoremap("<C-k>w", "<cmd>bufdo bd<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>fiw", "<cmd>vimgrep <C-R>=expand(\"<cword>\")<CR> %<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader><leader>fm", "<cmd>%s/\r//g<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>fwh", "<cmd>h <C-R>=expand(\"<cword>\")<CR><CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>sa", "<cmd>wa<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>gy", "ggyG<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>g=", "gg=G<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>gd", "ggdG<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>gc", "ggcG<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>c.", "ct.")
	vim.g.alma3lol.bindings.nnoremap("<leader>c,", "ct,")
	vim.g.alma3lol.bindings.nnoremap("<leader>c'", "ct'")
	vim.g.alma3lol.bindings.nnoremap("<leader>c", "ct\"")
	vim.g.alma3lol.bindings.nnoremap("<leader>c`", "ct`")
	vim.g.alma3lol.bindings.nnoremap("<leader>c9", "ct(")
	vim.g.alma3lol.bindings.nnoremap("<leader>c0", "ct)")
	vim.g.alma3lol.bindings.nnoremap("<leader>c[", "ct[")
	vim.g.alma3lol.bindings.nnoremap("<leader>c]", "ct]")
	vim.g.alma3lol.bindings.nnoremap("<leader>c{", "ct{")
	vim.g.alma3lol.bindings.nnoremap("<leader>c}", "ct}")
	vim.g.alma3lol.bindings.nnoremap("<leader>c;", "ct;")
	vim.g.alma3lol.bindings.nnoremap("<leader>c4", "c$")
	vim.g.alma3lol.bindings.nnoremap("<leader>c5", "ci%")
	vim.g.alma3lol.bindings.nnoremap("<leader>c6", "c^")
	vim.g.alma3lol.bindings.nnoremap("<leader><leader>c'", "ci'")
	vim.g.alma3lol.bindings.nnoremap("<leader><leader>c", "ci\"")
	vim.g.alma3lol.bindings.nnoremap("<leader><leader>c`", "ci`")
	vim.g.alma3lol.bindings.nnoremap("<leader><leader>c9", "ci(")
	vim.g.alma3lol.bindings.nnoremap("<leader><leader>c[", "ci[")
	vim.g.alma3lol.bindings.nnoremap("<leader><leader>c{", "ci{")
	vim.g.alma3lol.bindings.nnoremap("<leader>d.", "dt.")
	vim.g.alma3lol.bindings.nnoremap("<leader>d,", "dt,")
	vim.g.alma3lol.bindings.nnoremap("<leader>d'", "dt'")
	vim.g.alma3lol.bindings.nnoremap("<leader>d", "dt\"")
	vim.g.alma3lol.bindings.nnoremap("<leader>d`", "dt`")
	vim.g.alma3lol.bindings.nnoremap("<leader>d9", "dt(")
	vim.g.alma3lol.bindings.nnoremap("<leader>d0", "dt)")
	vim.g.alma3lol.bindings.nnoremap("<leader>d[", "dt[")
	vim.g.alma3lol.bindings.nnoremap("<leader>d]", "dt]")
	vim.g.alma3lol.bindings.nnoremap("<leader>d{", "dt{")
	vim.g.alma3lol.bindings.nnoremap("<leader>d}", "dt}")
	vim.g.alma3lol.bindings.nnoremap("<leader>d;", "dt;")
	vim.g.alma3lol.bindings.nnoremap("<leader>d4", "d$")
	vim.g.alma3lol.bindings.nnoremap("<leader>d5", "di%")
	vim.g.alma3lol.bindings.nnoremap("<leader>d6", "d^")
	vim.g.alma3lol.bindings.nnoremap("<leader><leader>d'", "di'")
	vim.g.alma3lol.bindings.nnoremap("<leader><leader>d", "di\"")
	vim.g.alma3lol.bindings.nnoremap("<leader><leader>d`", "di`")
	vim.g.alma3lol.bindings.nnoremap("<leader><leader>d9", "di(")
	vim.g.alma3lol.bindings.nnoremap("<leader><leader>d[", "di[")
	vim.g.alma3lol.bindings.nnoremap("<leader><leader>d{", "di{")
	vim.g.alma3lol.bindings.nnoremap("<leader>y.", "yt.")
	vim.g.alma3lol.bindings.nnoremap("<leader>y,", "yt,")
	vim.g.alma3lol.bindings.nnoremap("<leader>y'", "yt'")
	vim.g.alma3lol.bindings.nnoremap("<leader>y", "yt\"")
	vim.g.alma3lol.bindings.nnoremap("<leader>y`", "yt`")
	vim.g.alma3lol.bindings.nnoremap("<leader>y9", "yt(")
	vim.g.alma3lol.bindings.nnoremap("<leader>y0", "yt)")
	vim.g.alma3lol.bindings.nnoremap("<leader>y[", "yt[")
	vim.g.alma3lol.bindings.nnoremap("<leader>y]", "yt]")
	vim.g.alma3lol.bindings.nnoremap("<leader>y{", "yt{")
	vim.g.alma3lol.bindings.nnoremap("<leader>y}", "yt}")
	vim.g.alma3lol.bindings.nnoremap("<leader>y;", "yt;")
	vim.g.alma3lol.bindings.nnoremap("<leader>y4", "y$")
	vim.g.alma3lol.bindings.nnoremap("<leader>y5", "yi%")
	vim.g.alma3lol.bindings.nnoremap("<leader>y6", "y^")
	vim.g.alma3lol.bindings.nnoremap("<leader><leader>y'", "yi'")
	vim.g.alma3lol.bindings.nnoremap("<leader><leader>y", "yi\"")
	vim.g.alma3lol.bindings.nnoremap("<leader><leader>y`", "yi`")
	vim.g.alma3lol.bindings.nnoremap("<leader><leader>y9", "yi(")
	vim.g.alma3lol.bindings.nnoremap("<leader><leader>y[", "yi[")
	vim.g.alma3lol.bindings.nnoremap("<leader><leader>y{", "yi{")
	vim.g.alma3lol.bindings.nnoremap("<leader>bd", "<cmd>bd<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>xbd", "<cmd>bd!<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>nb", "<cmd>ene<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>w", "<cmd>w<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>xw", "<cmd>w!<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>vw", "<cmd>vs<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>nvw", "<cmd>sp<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>nt", "<cmd>tab split<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader><leader>v", "V")
	vim.g.alma3lol.bindings.nnoremap("<F2>", ":set invpaste paste?<CR><CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>vp", "V}")
	vim.g.alma3lol.bindings.nnoremap("<leader>vb", "<C-V>}")
	-- vim.g.alma3lol.bindings.xnoremap("p", '"_dP')
	-- vim.g.alma3lol.bindings.xnoremap("d", '"_d')
	vim.g.alma3lol.bindings.xnoremap(".", "<cmd>normal.<cr>")
	vim.g.alma3lol.bindings.xnoremap("@", "<cmd>normal@@<cr>")
	vim.g.alma3lol.bindings.xremap("<tab>", ">")
	vim.g.alma3lol.bindings.xremap("<s-tab>", "<")
	vim.g.alma3lol.bindings.inoremap("<F2>", "<C-O><cmd>set invpaste paste?<CR><CR>")
	vim.g.alma3lol.bindings.inoremap("<leader><leader><BS>", "<Esc>v0c")
	vim.g.alma3lol.bindings.inoremap("<leader><leader>o", "<Esc>o")
	vim.g.alma3lol.bindings.inoremap("<leader><leader>no", "<Esc>O")
	vim.g.alma3lol.bindings.inoremap("<leader><leader>p", "<Esc>pa")
end
