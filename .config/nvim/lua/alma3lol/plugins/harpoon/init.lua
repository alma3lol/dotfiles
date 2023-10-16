local M = {
	setup = function ()
		require('alma3lol.plugins.harpoon.setup')
	end,
	bindings = function ()
		require('alma3lol.plugins.harpoon.bindings')
	end,
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
