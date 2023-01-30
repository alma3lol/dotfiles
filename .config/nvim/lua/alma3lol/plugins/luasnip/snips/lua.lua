local status, luasnip = pcall(require, 'luasnip')
if (not status) then
    return
end

local fmt = require "luasnip.extras.fmt".fmt
local s = luasnip.snippet
local i = luasnip.insert_node
local c = luasnip.choice_node
local t = luasnip.text_node

return {
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
}
