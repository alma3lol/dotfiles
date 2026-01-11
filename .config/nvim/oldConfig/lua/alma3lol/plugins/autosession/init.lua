local M = {
	setup = function ()
		require('alma3lol.plugins.autosession.setup')
	end
}

M.init = function()
	M.setup()
end

return M
