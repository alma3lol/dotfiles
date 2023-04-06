local nm = require('neo-minimap')
nm.set("<leader>nm", "typescriptreact", {
  query = [[
    ((function_declaration) @cap)
    ((arrow_function) @cap)
    ((identifier) @cap (#vim-match? @cap "^use.*"))
  ]],
})

nm.set("<leader>nm", "lua", {
  query = [[
    ((function_declaration) @cap)
    ((assignment_statement(expression_list(function_definition))) @cap)
  ]],
})
