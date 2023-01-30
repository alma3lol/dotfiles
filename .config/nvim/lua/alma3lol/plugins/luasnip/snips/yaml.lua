local function prequire(...)
    local status, lib = pcall(require, ...)
    if (status) then return lib end
    return nil
end

local luasnip = prequire('luasnip')

local fmt = require"luasnip.extras.fmt".fmt
local s = luasnip.snippet
local sn = luasnip.snippet_node
local i = luasnip.insert_node
local t = luasnip.text_node
-- local f = luasnip.function_node
local c = luasnip.choice_node
local d = luasnip.dynamic_node
-- local r = require"luasnip.extras".rep

-- local u = function (index)
--     return f(function(args)
--         return args[index][1]:upper()
--     end, { index })
-- end
--
-- local l = function (index)
--     return f(function(args)
--         return args[index][1]:lower()
--     end, { index })
-- end
--
--
-- local lowercaseFirstLetter = function (index)
--     return f(function(args)
--         return args[index][1]:sub(1,1):lower()..args[index][1]:sub(2)
--     end, { index })
-- end
--
-- local uppercaseFirstLetter = function (index)
--     return f(function(args)
--         return args[index][1]:sub(1,1):upper()..args[index][1]:sub(2)
--     end, { index })
-- end

local rec_ls
rec_ls = function()
  return sn(
    nil,
    c(1, {
      t(''),
      sn(nil, { t({ '', "\t- name: '" }), i(1), t '\'', d(2, rec_ls, {}) }),
    })
  )
end

return {
    s('zellijconfig',
        fmt([[
---
template:
  direction: Horizontal
  parts:
    - direction: Vertical
      borderless: true
      split_size:
        Fixed: 1
      run:
        plugin:
          location: "zellij:tab-bar"
    - direction: Vertical
      body: true
tabs:{tabs}
session:
  name: '{sessionName}'
  attach: true
        ]], {
                sessionName = i(1),
                tabs = d(2, rec_ls, {}),
        })
    ),
  s('zellijtabfocus', t('focus: true')),
  s('zellijtabsplit',  c(1, {
    fmt([[
    direction: Vertical
    parts:
    - direction: Horizontal
      split_size:
        percent: {}
    - direction: Horizontal
      split_size:
        percent: {}
          ]], {
        i(1, '50'),
        i(2, '50'),
      }),
    fmt([[
    direction: Vertical
    parts:
    - direction: Horizontal
      split_size:
        percent: {}
      parts:
        - direction: Vertical
        - direction: Vertical
    - direction: Horizontal
      split_size:
        percent: {}
    ]], {
i(1, '50'),
i(2, '50'),
      }),
  })
  ),
}
