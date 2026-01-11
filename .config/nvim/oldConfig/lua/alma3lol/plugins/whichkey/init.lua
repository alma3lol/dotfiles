local M = {
	setup = require('alma3lol.plugins.whichkey.setup'),
	bindings = require('alma3lol.plugins.whichkey.bindings'),
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
