vim.pack.add({
    "https://github.com/lewis6991/gitsigns.nvim",
})

require("gitsigns").setup({
    signs = {
        add          = { text = "+" },
        delete       = { text = "_", show_count = true },
        topdelete    = { text = "‾", show_count = true },
    },
    current_line_blame      = true,
    current_line_blame_opts = {
        delay = 300,
    },
})
