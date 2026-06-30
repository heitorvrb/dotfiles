vim.pack.add({
    "https://github.com/folke/flash.nvim",
})

require("flash").setup()

vim.keymap.set({ "n", "x", "o" }, "f", function()
    require("flash").jump({
        search = { mode = "search", max_length = 1 },
        label = { after = false, before = true },
    })
end, { desc = "Jump search with Flash" })

vim.keymap.set({ "n", "x", "o" }, "<leader>s", function()
    require("flash").treesitter()
end, { desc = "Select with Flash & Treesitter" })
