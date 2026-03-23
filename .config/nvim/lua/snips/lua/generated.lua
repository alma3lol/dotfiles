local ls = require("luasnip")
local fmt = require "luasnip.extras.fmt".fmt
local s = ls.snippet
local i = ls.insert_node
local c = ls.choice_node
local t = ls.text_node

return {
  s(
    "pins",
    fmt([=[
print(vim.inspect({}))
]=], {
      i(1),
    })
  ),
  s('prettierrc',
    fmt([[
{{
  "trailingComma": "es5",
  "tabWidth": {tabWidth},
  "semi": {semi},
  "singleQuote": {signleQuote}
}}
        ]], {
      tabWidth = c(1, { t '2', t '4', i(1) }),
      semi = c(2, { t 'true', t 'false' }),
      signleQuote = c(3, { t 'true', t 'false' }),
    })
  ),
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
