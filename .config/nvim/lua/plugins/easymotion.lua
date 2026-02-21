return {
  "easymotion/vim-easymotion",
  keys = {
    { "<Leader><Leader>f", "<cmd>call EasyMotion#OverwinF(1)<cr>", desc = "Search for 1 char" },
    { "<Leader><Leader>l", "<cmd>call EasyMotion#overwin#line()<cr>", desc = "Move to line" },
    { "<Leader><Leader>w", "<cmd>call EasyMotion#overwin#w()<cr>", desc = "Move to word" },
  },
}
