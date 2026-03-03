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
}
