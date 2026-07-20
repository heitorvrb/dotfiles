vim.g.mapleader = " "

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })
vim.keymap.set({ "n", "v" }, "<leader>D", [["_dd]], { desc = "Delete whole line without yanking" })

vim.keymap.set("n", "<leader>n", "<cmd>nohlsearch<CR>", { desc = "Clear search highlighting", silent = true })

vim.keymap.set("n", "<leader>w", function()
    vim.opt_local.wrap = not vim.opt_local.wrap:get()
    vim.notify("Wrap: " .. (vim.opt_local.wrap:get() and "ON" or "OFF"))
end, { desc = "Toggle wrap", silent = true })

vim.keymap.set("i", "<M-BS>", "<C-w>", { desc = "Delete word before cursor" })

vim.keymap.set("n", "<leader>u", function()
    vim.cmd.packadd("nvim.undotree")
    require("undotree").open()
end, { desc = "Toggle Undotree" })
