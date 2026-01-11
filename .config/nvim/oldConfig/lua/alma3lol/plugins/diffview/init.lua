local M = {
	setup = function()
		require('alma3lol.plugins.diffview.setup')
	end,
	bindings = function()
		require('alma3lol.plugins.diffview.bindings')
	end
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
