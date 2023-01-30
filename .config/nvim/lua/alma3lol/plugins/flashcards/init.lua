local M = {
	setup = require('alma3lol.plugins.flashcards.setup'),
	bindings = require('alma3lol.plugins.flashcards.bindings')
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
