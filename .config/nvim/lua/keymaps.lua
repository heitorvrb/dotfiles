vim.g.mapleader = " "

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })
vim.keymap.set({ "n", "v" }, "<leader>D", [["_dd]], { desc = "Delete whole line without yanking" })

vim.keymap.set("n", "<Esc><Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlighting", silent = true })

vim.keymap.set("i", "<M-BS>", "<C-w>", { desc = "Delete word before cursor" })

vim.keymap.set("n", "<leader>u", function()
    vim.cmd.packadd("nvim.undotree")
    require("undotree").open()
end, { desc = "Toggle Undotree" })
