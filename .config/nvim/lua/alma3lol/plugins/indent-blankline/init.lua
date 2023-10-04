local M = {
	setup = function ()
		require('alma3lol.plugins.indent-blankline.setup')
	end
}

M.init = function()
	M.setup()
end

return M
