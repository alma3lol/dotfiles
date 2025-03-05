local M = {
	setup = function()
		require('alma3lol.plugins.lspsaga.setup')
	end,
	bindings = function()
		require('alma3lol.plugins.lspsaga.bindings')
	end,
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
