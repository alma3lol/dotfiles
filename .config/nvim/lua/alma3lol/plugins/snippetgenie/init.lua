local M = {
	bindings = require('alma3lol.plugins.snippetgenie.bindings'),
	setup = require('alma3lol.plugins.snippetgenie.setup'),
}

M.init = function()
	M.bindings()
	M.setup()
end

return M

