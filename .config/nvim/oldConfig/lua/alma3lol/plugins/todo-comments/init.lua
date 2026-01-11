local M = {
	setup = function()
		require('alma3lol.plugins.todo-comments.setup')
	end,
	bindings = function()
		require('alma3lol.plugins.todo-comments.bindings')
	end
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
