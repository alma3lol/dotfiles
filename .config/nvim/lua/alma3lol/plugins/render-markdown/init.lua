local M = {
	setup = function()
		require('alma3lol.plugins.render-markdown.setup')
	end,
}

M.init = function()
	M.setup()
end

return M
