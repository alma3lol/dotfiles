return function()
	vim.api.nvim_create_user_command("TelescopeOverrides", function()
		local colors = {
			fg = "#abb2bf",
			green = "#89ca78",
			dark_gray = '#1A1A1A',
			darker_gray = '#141414',
			darkest_gray = '#080808',
		}

		vim.api.nvim_set_hl(0, 'TelescopeMatching', { fg = colors.green })

		vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = colors.darkest_gray })
		vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', { fg = colors.fg, bg = colors.dark_gray })
		vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', { fg = colors.fg, bg = colors.dark_gray })

		vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = colors.darkest_gray, bg = colors.darkest_gray })
		vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = colors.darker_gray, bg = colors.darker_gray })
		vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { fg = colors.dark_gray, bg = colors.dark_gray })
		vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { fg = colors.dark_gray, bg = colors.dark_gray })

		vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { fg = colors.fg, bg = colors.darker_gray })
		vim.api.nvim_set_hl(0, 'TelescopePromptCounter', { fg = colors.green })
		vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = colors.green, bg = colors.darker_gray })

		vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = colors.darkest_gray, bg = colors.green })
		vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = colors.darkest_gray, bg = colors.green })
		vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = colors.green, bg = colors.dark_gray })

		vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = colors.darker_gray })
		vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { fg = colors.green, bg = colors.dark_gray })
	end, {})

	vim.api.nvim_create_user_command("TerminalOverrides", function()
		vim.api.nvim_set_hl(0, 'TermCursor', { bg = "#aaaaaa" })
	end, {})

	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "TelescopePrompt", "floaterm", "lazygit" },
		callback = function()
			if vim.bo.filetype == "TelescopePrompt" then
				vim.cmd("TelescopeOverrides")
			elseif vim.bo.filetype == "floaterm" or vim.bo.filetype == "lazygit" then
				vim.cmd("TerminalOverrides")
			end
		end
	})
end
