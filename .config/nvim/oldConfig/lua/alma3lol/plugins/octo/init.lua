local M = {
	setup = function ()
		require('alma3lol.plugins.octo.setup')
	end,
	bindings = function ()
		require('alma3lol.plugins.octo.bindings')
	end,
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
