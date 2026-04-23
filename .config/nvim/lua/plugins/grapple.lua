return {
  "cbochs/grapple.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", lazy = true },
  },
  keys = {
    { "<leader>tm", "<cmd>Grapple toggle_tags<cr>" },
    { "<leader>mm", "<cmd>Grapple toggle<cr>" },
    { "<leader>m1", "<cmd>Grapple cycle_tags prev scope=cwd<cr>" },
    { "<leader>m2", "<cmd>Grapple cycle_tags next scope=cwd<cr>" },
  },
}
