return function()
  require('neo-minimap').set("<leader><leader>m", "typescriptreact", {
    query = [[
    ((function_declaration) @cap)
    ((arrow_function) @cap)
    ((identifier) @cap (#vim-match? @cap "^use.*"))
  ]] ,
  })
end
