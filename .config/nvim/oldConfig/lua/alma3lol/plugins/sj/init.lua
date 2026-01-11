local M = {
	setup = require('alma3lol.plugins.sj.setup'),
	bindings = require('alma3lol.plugins.sj.bindings'),
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
