vim.pack.add({
    "https://github.com/lewis6991/gitsigns.nvim",
})

local gs = require("gitsigns")

gs.setup({
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

vim.keymap.set('n', '<leader>hn', gs.next_hunk, { desc = "Next git hunk" })
vim.keymap.set('n', '<leader>hy', gs.prev_hunk, { desc = "Previous git hunk" })
vim.keymap.set('n', '<leader>hs', gs.stage_hunk, { desc = "Stage hunk" })
vim.keymap.set('n', '<leader>hr', gs.reset_hunk, { desc = "Reset hunk" })
vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, { desc = "Undo stage hunk" })
vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { desc = "Preview hunk" })
vim.keymap.set('n', '<leader>hb', gs.blame_line, { desc = "Blame line" })
