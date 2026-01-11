local prettier = require("prettier")

prettier.setup({
    bin = 'prettierd',
    filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
        "lua",
    },
})

vim.api.nvim_create_autocmd('BufWritePre', {
    command = 'Prettier'
})
