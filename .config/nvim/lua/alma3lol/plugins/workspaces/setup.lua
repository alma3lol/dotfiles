return function()
	require('workspaces').setup {
		hooks = {
			open = function()
				vim.cmd 'bufdo bd'
				vim.schedule(function()
					local pwd = vim.api.nvim_command_output 'pwd'
					require 'auto-session'.RestoreSessionFromFile(pwd)
				end)
			end,
		}
	}
end
