vim.pack.add({
    "https://github.com/coder/claudecode.nvim",
})

require("claudecode").setup({
    terminal_cmd = "~/.local/bin/claude",
})
