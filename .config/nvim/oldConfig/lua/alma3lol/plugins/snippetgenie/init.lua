local M = {
	bindings = function()
		require('alma3lol.plugins.snippetgenie.bindings')
	end,
	setup = function()
		require('alma3lol.plugins.snippetgenie.setup')
	end,
}

M.init = function()
	M.bindings()
	M.setup()
end

return M
