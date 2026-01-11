-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/alma3lol/.cache/nvim/packer_hererocks/2.1.1741730670/share/lua/5.1/?.lua;/home/alma3lol/.cache/nvim/packer_hererocks/2.1.1741730670/share/lua/5.1/?/init.lua;/home/alma3lol/.cache/nvim/packer_hererocks/2.1.1741730670/lib/luarocks/rocks-5.1/?.lua;/home/alma3lol/.cache/nvim/packer_hererocks/2.1.1741730670/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/alma3lol/.cache/nvim/packer_hererocks/2.1.1741730670/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["ChatGPT.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/ChatGPT.nvim",
    url = "https://github.com/jackMort/ChatGPT.nvim"
  },
  ["Comment.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["NeoComposer.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/NeoComposer.nvim",
    url = "https://github.com/ecthelionvi/NeoComposer.nvim"
  },
  SnippetGenie = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/SnippetGenie",
    url = "https://github.com/ziontee113/SnippetGenie"
  },
  ale = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/ale",
    url = "https://github.com/dense-analysis/ale"
  },
  ["auto-session"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/auto-session",
    url = "https://github.com/rmagatti/auto-session"
  },
  ["baleia.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/baleia.nvim",
    url = "https://github.com/m00qek/baleia.nvim"
  },
  ["battery.vim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/battery.vim",
    url = "https://github.com/lambdalisue/battery.vim"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["chafa.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/chafa.nvim",
    url = "https://github.com/princejoogie/chafa.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["codecompanion.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/codecompanion.nvim",
    url = "https://github.com/olimorris/codecompanion.nvim"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["ctrlp.vim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/ctrlp.vim",
    url = "https://github.com/ctrlpvim/ctrlp.vim"
  },
  ["custom-theme.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/custom-theme.nvim",
    url = "https://github.com/Djancyp/custom-theme.nvim"
  },
  ["denite.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/denite.nvim",
    url = "https://github.com/Shougo/denite.nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["fidget.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  firenvim = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/firenvim",
    url = "https://github.com/glacambre/firenvim"
  },
  ["flash.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/flash.nvim",
    url = "https://github.com/folke/flash.nvim"
  },
  ["flashcards.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/flashcards.nvim",
    url = "https://github.com/alex-laycalvert/flashcards.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gp.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/gp.nvim",
    url = "https://github.com/robitx/gp.nvim"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/gv.vim",
    url = "https://github.com/junegunn/gv.vim"
  },
  harpoon = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["instant.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/instant.nvim",
    url = "https://github.com/jbyuki/instant.nvim"
  },
  ["jsonc.vim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/jsonc.vim",
    url = "https://github.com/neoclide/jsonc.vim"
  },
  ["jupyter_ascending.vim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/jupyter_ascending.vim",
    url = "https://github.com/untitled-ai/jupyter_ascending.vim"
  },
  ["kdl.vim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/kdl.vim",
    url = "https://github.com/imsnif/kdl.vim"
  },
  ["key-menu.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/key-menu.nvim",
    url = "https://github.com/emmanueltouzery/key-menu.nvim"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/lazygit.nvim",
    url = "https://github.com/kdheepak/lazygit.nvim"
  },
  ["legendary.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/legendary.nvim",
    url = "https://github.com/mrjones2014/legendary.nvim"
  },
  ["linear.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/linear.nvim",
    url = "https://github.com/alma3lol/linear.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lsp-format.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/lsp-format.nvim",
    url = "https://github.com/lukas-reineke/lsp-format.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/lsp-status.nvim",
    url = "https://github.com/nvim-lua/lsp-status.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/nvimdev/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["mcphub.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/mcphub.nvim",
    url = "https://github.com/ravitemer/mcphub.nvim"
  },
  ["mind.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/mind.nvim",
    url = "https://github.com/phaazon/mind.nvim"
  },
  ["mini.diff"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/mini.diff",
    url = "https://github.com/echasnovski/mini.diff"
  },
  ["mini.indentscope"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/mini.indentscope",
    url = "https://github.com/echasnovski/mini.indentscope"
  },
  my_theme = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/my_theme",
    url = "/home/alma3lol/.config/nvim/lua/my_theme"
  },
  ["neo-minimap"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/neo-minimap",
    url = "https://github.com/ziontee113/neo-minimap"
  },
  ["neodev.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  nerdtree = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "https://github.com/preservim/nerdtree"
  },
  ["noice.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/noice.nvim",
    url = "https://github.com/folke/noice.nvim"
  },
  ["nordic.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nordic.nvim",
    url = "https://github.com/AlexvZyl/nordic.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/opt/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-gomove"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nvim-gomove",
    url = "https://github.com/booperlv/nvim-gomove"
  },
  ["nvim-jqx"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nvim-jqx",
    url = "https://github.com/gennaro-tedesco/nvim-jqx"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lsp-notify"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nvim-lsp-notify",
    url = "https://github.com/mrded/nvim-lsp-notify"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-neoclip.lua"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua",
    url = "https://github.com/AckslD/nvim-neoclip.lua"
  },
  ["nvim-nio"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nvim-nio",
    url = "https://github.com/nvim-neotest/nvim-nio"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-rename-state"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nvim-rename-state",
    url = "https://github.com/olrtg/nvim-rename-state"
  },
  ["nvim-spectre"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nvim-spectre",
    url = "https://github.com/nvim-pack/nvim-spectre"
  },
  ["nvim-surround"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-terminal.lua"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nvim-terminal.lua",
    url = "https://github.com/norcalli/nvim-terminal.lua"
  },
  ["nvim-toggleterm.lua"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua",
    url = "https://github.com/akinsho/nvim-toggleterm.lua"
  },
  ["nvim-transparent"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nvim-transparent",
    url = "https://github.com/xiyaowong/nvim-transparent"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/romgrk/nvim-treesitter-context"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-treesitter-textsubjects"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textsubjects",
    url = "https://github.com/RRethy/nvim-treesitter-textsubjects"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  nvim_context_vt = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/nvim_context_vt",
    url = "https://github.com/haringsrob/nvim_context_vt"
  },
  ["octo.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/octo.nvim",
    url = "https://github.com/pwntester/octo.nvim"
  },
  ["package-info.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/package-info.nvim",
    url = "https://github.com/vuki656/package-info.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["parinfer-rust"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/parinfer-rust",
    url = "https://github.com/eraserhd/parinfer-rust"
  },
  playground = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["prettier.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/prettier.nvim",
    url = "https://github.com/MunifTanjim/prettier.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/quick-scope",
    url = "https://github.com/unblevable/quick-scope"
  },
  ["rasi.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/opt/rasi.vim",
    url = "https://github.com/Fymyte/rasi.vim"
  },
  ["render-markdown.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/render-markdown.nvim",
    url = "https://github.com/MeanderingProgrammer/render-markdown.nvim"
  },
  rnvimr = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/rnvimr",
    url = "https://github.com/kevinhwang91/rnvimr"
  },
  ["scratch.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/scratch.nvim",
    url = "https://github.com/shift-d/scratch.nvim"
  },
  ["scratch.vim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/scratch.vim",
    url = "https://github.com/mtth/scratch.vim"
  },
  ["session-lens"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/session-lens",
    url = "https://github.com/rmagatti/session-lens"
  },
  ["sideways.vim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/sideways.vim",
    url = "https://github.com/AndrewRadev/sideways.vim"
  },
  ["sj.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/sj.nvim",
    url = "https://github.com/woosaaahh/sj.nvim"
  },
  sniprun = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/sniprun",
    url = "https://github.com/michaelb/sniprun"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/sqlite.lua",
    url = "https://github.com/kkharji/sqlite.lua"
  },
  ["ssr.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/ssr.nvim",
    url = "https://github.com/cshuaimin/ssr.nvim"
  },
  ["substitute.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/substitute.nvim",
    url = "https://github.com/gbprod/substitute.nvim"
  },
  ["suda.vim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/suda.vim",
    url = "https://github.com/lambdalisue/suda.vim"
  },
  ["sxhkd-vim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/sxhkd-vim",
    url = "https://github.com/kovetskiy/sxhkd-vim"
  },
  ["symbol-usage.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/symbol-usage.nvim",
    url = "https://github.com/Wansmer/symbol-usage.nvim"
  },
  tagbar = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/tagbar",
    url = "https://github.com/preservim/tagbar"
  },
  ["telescope-alternate"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/telescope-alternate",
    url = "https://github.com/otavioschwanck/telescope-alternate"
  },
  ["telescope-command-palette.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/telescope-command-palette.nvim",
    url = "https://github.com/LinArcX/telescope-command-palette.nvim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
  },
  ["telescope-emoji.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/telescope-emoji.nvim",
    url = "https://github.com/xiyaowong/telescope-emoji.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-frecency.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim",
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-lsp-handlers.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/telescope-lsp-handlers.nvim",
    url = "https://github.com/gbrlsnchs/telescope-lsp-handlers.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim",
    url = "https://github.com/nvim-telescope/telescope-media-files.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim",
    url = "https://github.com/nvim-telescope/telescope-symbols.nvim"
  },
  ["telescope-tmux.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/telescope-tmux.nvim",
    url = "https://github.com/camgraff/telescope-tmux.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  tern_for_vim = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/tern_for_vim",
    url = "https://github.com/ternjs/tern_for_vim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["twilight.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ["typescript-vim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/typescript-vim",
    url = "https://github.com/leafgarland/typescript-vim"
  },
  undotree = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-buf"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-buf",
    url = "https://github.com/bufbuild/vim-buf"
  },
  ["vim-bujo"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-bujo",
    url = "https://github.com/vuciv/vim-bujo"
  },
  ["vim-ctrlspace"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-ctrlspace",
    url = "https://github.com/vim-ctrlspace/vim-ctrlspace"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-dadbod",
    url = "https://github.com/tpope/vim-dadbod"
  },
  ["vim-dadbod-ui"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-dadbod-ui",
    url = "https://github.com/kristijanhusak/vim-dadbod-ui"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-dotenv"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-dotenv",
    url = "https://github.com/tpope/vim-dotenv"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-easymotion",
    url = "https://github.com/easymotion/vim-easymotion"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-indent-object",
    url = "https://github.com/michaeljsmith/vim-indent-object"
  },
  ["vim-json"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-json",
    url = "https://github.com/elzr/vim-json"
  },
  ["vim-jsonc"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-jsonc",
    url = "https://github.com/kevinoid/vim-jsonc"
  },
  ["vim-jsx-typescript"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-jsx-typescript",
    url = "https://github.com/peitalin/vim-jsx-typescript"
  },
  ["vim-man"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-man",
    url = "https://github.com/vim-utils/vim-man"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-maximizer"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-maximizer",
    url = "https://github.com/szw/vim-maximizer"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-polyglot",
    url = "https://github.com/sheerun/vim-polyglot"
  },
  ["vim-prisma"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-prisma",
    url = "https://github.com/pantharshit00/vim-prisma"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-ripgrep"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-ripgrep",
    url = "https://github.com/jremmen/vim-ripgrep"
  },
  ["vim-run-in-blender"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-run-in-blender",
    url = "https://github.com/alma3lol/vim-run-in-blender"
  },
  ["vim-signify"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-signify",
    url = "https://github.com/mhinz/vim-signify"
  },
  ["vim-silicon"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-silicon",
    url = "https://github.com/segeljakt/vim-silicon"
  },
  ["vim-sneak"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-sneak",
    url = "https://github.com/justinmk/vim-sneak"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  ["workspaces.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/workspaces.nvim",
    url = "https://github.com/natecraddock/workspaces.nvim"
  },
  ["yuck.vim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/yuck.vim",
    url = "https://github.com/elkowar/yuck.vim"
  },
  ["zen-mode.nvim"] = {
    loaded = true,
    path = "/home/alma3lol/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\rmarkdown\19mkdp_filetypes\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType qf ++once lua require("packer.load")({'nvim-bqf'}, { ft = "qf" }, _G.packer_plugins)]]
vim.cmd [[au FileType rasi ++once lua require("packer.load")({'rasi.vim'}, { ft = "rasi" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/alma3lol/.local/share/nvim/site/pack/packer/opt/rasi.vim/ftdetect/rasi.vim]], true)
vim.cmd [[source /home/alma3lol/.local/share/nvim/site/pack/packer/opt/rasi.vim/ftdetect/rasi.vim]]
time([[Sourcing ftdetect script at: /home/alma3lol/.local/share/nvim/site/pack/packer/opt/rasi.vim/ftdetect/rasi.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
