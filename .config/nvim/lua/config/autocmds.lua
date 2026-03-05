-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("FileChangedShell", {
  pattern = "*__virtual.html",
  callback = function()
    vim.v.fcs_choice = "" -- do nothing (ignore change)
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*__virtual.html",
  callback = function(args)
    vim.opt_local.autoread = false
    vim.diagnostic.enable(false, { bufnr = args.buf })

    -- Make virtual Razor html buffers disposable so nvim never prompts to save them
    vim.bo[args.buf].buftype = "nofile"
    vim.bo[args.buf].bufhidden = "wipe"
    vim.bo[args.buf].swapfile = false
    vim.bo[args.buf].undofile = false
    vim.bo[args.buf].modified = false
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "*__virtual.html",
  callback = function(args)
    vim.bo[args.buf].modified = false
    for _, client in ipairs(vim.lsp.get_clients({ bufnr = args.buf })) do
      vim.lsp.buf_detach_client(args.buf, client.id)
    end
  end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  callback = function()
    if vim.fn.expand("%:t"):match("__virtual%.html$") then return end
    vim.cmd("checktime")
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    -- Keep only Roslyn on Razor buffers
    if vim.bo[bufnr].filetype == "razor" and client.name ~= "roslyn" then
      client.stop(true)
      return
    end

    -- Global Roslyn perf tuning (cs + razor)
    if client.name == "roslyn" then
      if client.server_capabilities.semanticTokensProvider then
        pcall(vim.lsp.semantic_tokens.stop, bufnr, client.id)
      end
      client.server_capabilities.documentHighlightProvider = false
      client.server_capabilities.codeLensProvider = nil
      pcall(vim.lsp.inlay_hint.enable, false, { bufnr = bufnr })

      vim.diagnostic.config({
        virtual_text = false,
        update_in_insert = false,
        severity_sort = true,
      }, bufnr)
    end
  end,
})
