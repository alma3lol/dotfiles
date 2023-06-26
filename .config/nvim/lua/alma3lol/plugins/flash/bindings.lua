vim.g.alma3lol.bindings.nnoremap(',sn', function()
	require("flash").treesitter()
end)
vim.g.alma3lol.bindings.nnoremap(',fw', function()
	require("flash").jump({
		pattern = vim.fn.expand("<cword>"),
	})
end)

local Config = require("flash.config")
local Char = require("flash.plugins.char")
for _, motion in ipairs({ "f", "t", "F", "T" }) do
	vim.g.alma3lol.bindings.nnoremap(motion, function()
		require("flash").jump(Config.get({
			mode = "char",
			search = {
				mode = Char.mode(motion),
				max_length = 1,
			},
		}, Char.motions[motion]))
	end)
	vim.g.alma3lol.bindings.xnoremap(motion, function()
		require("flash").jump(Config.get({
			mode = "char",
			search = {
				mode = Char.mode(motion),
				max_length = 1,
			},
		}, Char.motions[motion]))
	end)
	vim.g.alma3lol.bindings.onoremap(motion, function()
		require("flash").jump(Config.get({
			mode = "char",
			search = {
				mode = Char.mode(motion),
				max_length = 1,
			},
		}, Char.motions[motion]))
	end)
end
