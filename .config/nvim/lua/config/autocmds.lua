-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("FileChangedShell", {
  pattern = "*razor__virtual.html",
  callback = function()
    vim.v.fcs_choice = "" -- do nothing (ignore change)
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*razor__virtual.html",
  callback = function()
    vim.opt_local.autoread = false
  end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  callback = function()
    if vim.fn.expand("%:t"):match("razor__virtual%.html$") then return end
    vim.cmd("checktime")
  end,
})

-- Razor performance tuning for Roslyn
vim.api.nvim_create_autocmd("FileType", {
  pattern = "razor",
  callback = function(args)
    -- Reduce redraw cost from diagnostics in very “busy” Razor buffers
    vim.diagnostic.config({
      virtual_text = false,
      update_in_insert = false,
      severity_sort = true,
    }, args.buf)
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    if vim.bo[bufnr].filetype ~= "razor" then return end

    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    -- 1) Keep only Roslyn attached to Razor buffers (optional but often huge)
    if client.name ~= "roslyn" then
      client.stop(true)
      return
    end

    -- 2) Semantic tokens can be a big perf hit in mixed Razor docs.
    -- Also note: semantic tokens + debounce has caused input lag in Neovim before. :contentReference[oaicite:1]{index=1}
    if client.server_capabilities.semanticTokensProvider then
      pcall(vim.lsp.semantic_tokens.stop, bufnr, client.id)
      -- client.server_capabilities.semanticTokensProvider = nil
    end

    -- 3) Disable cursor-idle features that often run via CursorHold autocmds
    client.server_capabilities.documentHighlightProvider = false
    client.server_capabilities.codeLensProvider = nil

    -- 4) If you enable inlay hints globally, disable them for Razor
    pcall(vim.lsp.inlay_hint.enable, false, { bufnr = bufnr })
  end,
})
