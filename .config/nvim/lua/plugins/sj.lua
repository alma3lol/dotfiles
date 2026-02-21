return {
  "woosaaahh/sj.nvim",
  config = function()
    require("sj").setup()
  end,
  keys = {
    {
      "s",
      function()
        require("sj").run()
      end,
      desc = "SJ search and jump",
    },
    {
      "<A-,>",
      function()
        require("sj").prev_match()
      end,
      desc = "SJ prev match",
    },
    {
      "<A-;>",
      function()
        require("sj").next_match()
      end,
      desc = "SJ next match",
    },
  },
}
