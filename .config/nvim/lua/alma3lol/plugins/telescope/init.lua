local M = {
	setup = function()
		require('alma3lol.plugins.telescope.setup')
	end,
	bindings = function()
		require('alma3lol.plugins.telescope.bindings')
	end,
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
