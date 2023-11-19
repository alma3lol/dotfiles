local M = {
	setup = function()
		require('alma3lol.plugins.gp.setup')
	end,
	bindings = function()
		require('alma3lol.plugins.gp.bindings')
	end
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
