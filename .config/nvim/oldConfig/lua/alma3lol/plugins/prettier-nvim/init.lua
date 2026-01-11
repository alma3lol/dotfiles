local M = {
	setup = function()
		require('alma3lol.plugins.prettier-nvim.setup')
	end,
	bindings = function()
		require('alma3lol.plugins.prettier-nvim.bindings')
	end,
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
