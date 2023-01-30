return function()
	vim.api.nvim_create_autocmd(
		"FileType",
		{ pattern = { "help", "startuptime", "qf", "lspinfo" }, command = [[nnoremap <buffer><silent> q :close<CR>]] }
	)
	vim.api.nvim_create_autocmd("FileType", { pattern = "man", command = [[nnoremap <buffer><silent> q :quit<CR>]] })


	local cursorGrp = vim.api.nvim_create_augroup("CursorLine", { clear = true })
	vim.api.nvim_create_autocmd(
		{ "InsertLeave", "WinEnter" },
		{ pattern = "*", callback = function()
			if vim.bo.filetype == "TelescopePrompt" then
				return
			end
			vim.cmd("set cursorline")
		end, group = cursorGrp }
	)
	vim.api.nvim_create_autocmd(
		{ "InsertEnter", "WinLeave" },
		{ pattern = "*", command = "set nocursorline", group = cursorGrp }
	)
	vim.api.nvim_create_autocmd({ "TextYankPost" }, {
		group = vim.api.nvim_create_augroup("LuaHighlight", {
			clear = false
		}),
		pattern = { "*" },
		callback = function()
			vim.highlight.on_yank({
				higroup = "Substitute",
				timeout = 150,
				on_macro = true
			})
		end
	})
end
