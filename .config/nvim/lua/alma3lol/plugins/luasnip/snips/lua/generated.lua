local ls = require("luasnip")
local fmt = require "luasnip.extras.fmt".fmt
local s = ls.snippet
local i = ls.insert_node

return {
s(
	"newsnippetplaceholder",
	fmt([=[
local ls = require("luasnip")
local fmt = require "luasnip.extras.fmt".fmt
local s = ls.snippet
local i = ls.insert_node

return {{
    ------------------------------------------------------ Snippets goes here
}}
]=], {
		
	})
),

	------------------------------------------------------ Snippets goes here
}
