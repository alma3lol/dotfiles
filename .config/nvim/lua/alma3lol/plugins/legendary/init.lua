local M = {
	setup = function()
		require('alma3lol.plugins.legendary.setup')
	end,
	bindings = function()
		require('alma3lol.plugins.legendary.bindings')
	end,
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
