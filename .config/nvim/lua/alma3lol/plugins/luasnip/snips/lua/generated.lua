local ls = require("luasnip")
local fmt = require "luasnip.extras.fmt".fmt
local s = ls.snippet
local i = ls.insert_node

return {
	s(
		"pins",
		fmt([=[
print(vim.inspect({}))
]=], {
			i(1),
		})
	),

	------------------------------------------------------ Snippets goes here
}
