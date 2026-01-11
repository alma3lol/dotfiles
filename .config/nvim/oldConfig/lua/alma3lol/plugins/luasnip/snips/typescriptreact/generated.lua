local ls = require("luasnip")
local fmt = require "luasnip.extras.fmt".fmt
local s = ls.snippet
local i = ls.insert_node

return {
s(
	"importfrom",
	fmt([=[
import {{  }} from '../{}{}{}{}{}}} from '../components';
]=], {
		i(1, "components"),
i(2, "  "),
i(3, "import {  } from '../components';"),
i(4, "components"),
i(5, "  "),
	})
),

    ------------------------------------------------------ Snippets goes here
}
