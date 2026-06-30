vim.pack.add({
    "https://github.com/nvim-mini/mini.nvim",
})

-- require("mini.files").setup()

require("mini.notify").setup({
    content = {
        format = function(notif)
            return notif.msg
        end,
    },
})

require("mini.cmdline").setup()
require("mini.completion").setup()

require("mini.comment").setup({
    options = {
        custom_commentstring = function()
            if vim.bo.filetype == "php" then
                return "// %s"
            end
            return vim.bo.commentstring
        end,
    },
})

require("mini.pairs").setup()

-- require("mini.diff").setup({
--     view = {
--         style = "sign",
--     }
-- })

local MiniPick = require("mini.pick")
MiniPick.setup()
vim.keymap.set("n", "<leader>pf", function() MiniPick.builtin.files() end, { desc = "Mini File Picker" })
vim.keymap.set("n", "<leader>ps", function() MiniPick.builtin.grep({ pattern = vim.fn.expand("<cword>") }) end,
    { desc = "Mini Word Search" })
vim.keymap.set("n", "<leader>pb", function() MiniPick.builtin.buffers() end, { desc = "Mini Buffer Picker" })

local MiniExtra = require("mini.extra")
MiniExtra.setup()
vim.keymap.set("n", "<leader>xx", function() MiniExtra.pickers.diagnostic() end, { desc = "Mini Extra Diagnostic" })
vim.keymap.set("n", "<leader>pk", function() MiniExtra.pickers.keymaps() end, { desc = "Search keymaps" })

