local M = {
	setup = function()
		require('alma3lol.plugins.linear.setup')
	end,
	bindings = function()
		require('alma3lol.plugins.linear.bindings')
	end,
}

M.init  = function()
	M.setup()
	M.bindings()
end

return M
