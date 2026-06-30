vim.pack.add({
    "https://github.com/stevearc/conform.nvim",
})

require("conform").setup({
    formatters_by_ft = {
        php = { "pint" },
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
    },
    format_on_save = {}
})
