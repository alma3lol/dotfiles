local M = {
	setup = function()
		require('alma3lol.plugins.treesitter.setup')
	end,
	bindings = function()
		require('alma3lol.plugins.treesitter.bindings')
	end,
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
