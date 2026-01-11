local M = {
	setup = function()
		require('alma3lol.plugins.mason.setup')
	end,
	bindings = function()
		require('alma3lol.plugins.mason.bindings')
	end,
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
