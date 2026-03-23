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
      "<C-D>",
      function()
        local ls = require("luasnip")
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end,
      mode = { "i", "n" }
    })
    table.insert(keys, {
      "<C-A>",
      function()
        local ls = require("luasnip")
        if ls.choice_active() then
          ls.change_choice(-1)
        end
      end,
      mode = { "i", "n" }
    })
    table.insert(keys, {
      "<C-E>",
      function()
        require("luasnip").expand()
      end,
      mode = { "i", "n" }
    })
  end,
  config = function()
    local types = require("luasnip.util.types")
    require("luasnip").config.setup({
      ext_opts = {
        [types.choiceNode] = {
          active = {
            virt_text = { { "●", "GruvboxOrange" } }
          }
        },
        [types.insertNode] = {
          active = {
            virt_text = { { "●", "GruvboxBlue" } }
          }
        }
      },
    })
  end,
  opts = {
    history = true,
    delete_check_events = "TextChanged",
  },
}
