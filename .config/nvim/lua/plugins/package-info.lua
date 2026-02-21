return {
  "vuki656/package-info.nvim",
  keys = {
    {
      ",ps",
      function()
        require("package-info").show()
      end,
      desc = "Show package's info",
    },
    {
      ",pd",
      function()
        require("package-info").delete()
      end,
      desc = "Delete package",
    },
    {
      ",pv",
      function()
        require("package-info").change_version()
      end,
      desc = "Change package's version",
    },
    {
      ",pi",
      function()
        require("package-info").install()
      end,
      desc = "Install a package",
    },
    {
      ",pu",
      function()
        require("package-info").update()
      end,
      desc = "Update a package",
    },
  },
}
