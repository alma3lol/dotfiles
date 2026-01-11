local M = {
	setup = require('alma3lol.plugins.comment.setup'),
	bindings = require('alma3lol.plugins.comment.bindings'),
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
