vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
})

require("telescope").setup({
    pickers = {
        find_files = {
            hidden = true,
        },
    },
})
require("telescope").load_extension("fzf")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>jf", builtin.find_files)
vim.keymap.set("n", "<leader>js", builtin.live_grep)
vim.keymap.set("n", "<leader>jb", builtin.buffers)
vim.keymap.set("n", "<leader>jg", builtin.git_status)
vim.keymap.set("n", "<leader>jx", builtin.diagnostics)
