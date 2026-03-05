return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_lua").load({ paths = { vim.fn.expand('$HOME') .. "/.config/nvim/lua/snips/" } })
      end,
    },
  },
  keys = function(_, keys)
    table.insert(keys, {
      "<C-,>",
      function()
        local ls = require("luasnip")
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end,
      mode = { "i", "n" }
    })
    table.insert(keys, {
      "<C-.>",
      function()
        local ls = require("luasnip")
        if ls.choice_active() then
          ls.change_choice(-1)
        end
      end,
      mode = { "i", "n" }
    })
  end
}
