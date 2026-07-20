vim.pack.add({
    "https://github.com/m4xshen/hardtime.nvim",
})

require("hardtime").setup({
    max_count = 4,
    disable_mouse = false,
    disabled_keys = {
        ["<Up>"] = false,
        ["<Down>"] = false,
        ["<Left>"] = false,
        ["<Right>"] = false,
    },
    restricted_keys = {
        ["<Up>"] = { "n", "x" },
        ["<Down>"] = { "n", "x" },
        ["<Left>"] = { "n", "x" },
        ["<Right>"] = { "n", "x" },
    },
})
