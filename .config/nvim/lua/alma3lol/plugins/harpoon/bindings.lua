return function()
	vim.g.alma3lol.bindings.nnoremap("<leader>ha", ":lua require('harpoon.mark').add_file()<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>hw", ":lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>h1", ":lua require('harpoon.ui').nav_file(1)<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>h2", ":lua require('harpoon.ui').nav_file(2)<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>h3", ":lua require('harpoon.ui').nav_file(3)<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>h4", ":lua require('harpoon.ui').nav_file(4)<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>tu", ":lua require('harpoon.term').gotoTerminal(1)<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>te", ":lua require('harpoon.term').gotoTerminal(2)<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>cu", ":lua require('harpoon.term').sendCommand(1, 1)<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>ce", ":lua require('harpoon.term').sendCommand(1, 2)<CR>")
end
