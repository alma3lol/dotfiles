return {
  "seblyng/roslyn.nvim",
  -- enable = false,
  ---@module 'roslyn.config'
  ---@type RoslynNvimConfig
  opts = {
    -- your configuration comes here; leave empty for default settings
  },
  -- init = function()
  --   vim.filetype.add({
  --     extension = {
  --       razor = "razor",
  --       cshtml = "razor",
  --     },
  --   })
  -- end,
  config = function()
    local mason_root = require("mason.settings").current.install_root_dir
    -- local dlls_path = vim.fn.expand("$MASON/packages/roslyn/libexec/.razorExtension")

    -- local cmd = {
    --   "roslyn",
    --   "--stdio",
    --   "--logLevel=Information",
    --   "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
    --   "--razorSourceGenerator=" .. vim.fs.joinpath(dlls_path, "Microsoft.CodeAnalysis.Razor.Compiler.dll"),
    --   "--razorDesignTimePath=" .. vim.fs.joinpath(dlls_path, "Targets", "Microsoft.NET.Sdk.Razor.DesignTime.targets"),
    --   "--extension=" .. vim.fs.joinpath(dlls_path, "Microsoft.VisualStudioCode.RazorExtension.dll"),
    -- }

    vim.lsp.config("roslyn", {
      -- cmd = cmd,
      on_attach = function()
        print("This will run when the server attaches!")
      end,
      settings = {
        ["csharp|background_analysis"] = {
          background_analysis = {
            dotnet_analyzer_diagnostics_scope = "none",
            dotnet_compiler_diagnostics_scope = "none",
          },
        },
        ["csharp|inlay_hints"] = {
          csharp_enable_inlay_hints_for_implicit_object_creation = false,
          csharp_enable_inlay_hints_for_implicit_variable_types = false,
          csharp_enable_inlay_hints_for_types = false,
          dotnet_enable_inlay_hints_for_indexer_parameters = false,
          dotnet_enable_inlay_hints_for_literal_parameters = false,
          dotnet_enable_inlay_hints_for_parameters = false,
          dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
          dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
        },
        ["csharp|code_lens"] = {
          dotnet_enable_references_code_lens = false,
        },
      },
    })
  end,
}
