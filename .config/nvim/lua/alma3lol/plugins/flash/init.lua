local M = {
	bindings = function()
		require('alma3lol.plugins.flash.bindings')
	end,
	setup = function()
		require('alma3lol.plugins.flash.setup')
	end
}

M.init = function()
	M.bindings()
	M.setup()
end

return M
