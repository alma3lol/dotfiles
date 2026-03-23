return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    table.insert(opts.sections.lualine_x, {
      function()
        local bufnr = vim.api.nvim_get_current_buf()
        local clients = vim.lsp.get_clients({ bufnr = bufnr })
        if not opts.sections.lualine_x then
          opts.sections.lualine_x = {}
        end
        if next(clients) == nil then
          return "No LSP"
        else
          local client_names = {}
          for _, client in pairs(clients) do
            table.insert(client_names, client.name)
          end
          return table.concat(client_names, "|")
        end
      end,
      icon = " ",
      color = { fg = "#e0af68", gui = "bold" },
    })
  end,
}
