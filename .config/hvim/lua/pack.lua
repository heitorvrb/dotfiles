vim.pack.add({
    "https://github.com/nvim-mini/mini.nvim",
    "https://github.com/kylechui/nvim-surround",
    "https://github.com/folke/snacks.nvim",
    "https://github.com/coder/claudecode.nvim",
})

-- require("mini.files").setup()

-- require ("mini.notify").setup({
--     content = {         
--         format = function(notif)
--             reeturn notif.msg
--         end,
--     },
-- })

require("mini.cmdline").setup()

local MiniPick = require("mini.pick")
MiniPick.setup()
vim.keymap.set("n", "<leader>pf", function() MiniPick.builtin.files() end, { desc = "Mini File Picker" })
vim.keymap.set("n", "<leader>ps", function() MiniPick.builtin.grep({ pattern = vim.fn.expand("<cword>") }) end, { desc = "Mini Word Search" })
vim.keymap.set("n", "<leader>pb", function() MiniPick.builtin.buffers() end, { desc = "Mini Buffer Picker" })

local MiniExtra = require("mini.extra")
MiniExtra.setup()
vim.keymap.set("n", "<leader>xx", function() MiniExtra.pickers.diagnostic() end, { desc = "Mini Extra Diagnostic" })
-- vim.keymap.set("n", "<leader>pk", function() MiniExtra.pickers.keymaps() end, { desc = "Search keymaps" })

require("claudecode").setup({
    terminal_cmd = "~/.local/bin/claude",
})
