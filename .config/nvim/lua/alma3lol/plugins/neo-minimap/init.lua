local M = {
  setup = function()
    require('alma3lol.plugins.neo-minimap.setup')
  end,
}

M.init = function()
  M.setup()
end

return M
