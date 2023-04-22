local M = {
	setup = function()
		require('alma3lol.plugins.neocomposer.setup')
	end,
	bindings = function()
		require('alma3lol.plugins.neocomposer.bindings')
	end,
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
