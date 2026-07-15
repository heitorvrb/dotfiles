vim.pack.add({
    "https://github.com/esmuellert/codediff.nvim",
})

require("codediff").setup({})

-- codediff has no config option to start compact; auto-enable it on open
-- (mirrors the gc toggle keymap). CodeDiffOpen fires before render_everything
-- (scheduled earlier) actually populates the session for real (non-virtual)
-- files, so defer with vim.schedule to run after it. Harmlessly no-ops in
-- merge/conflict mode.
vim.api.nvim_create_autocmd("User", {
    pattern = "CodeDiffOpen",
    callback = function(args)
        local tabpage = args.data.tabpage
        vim.schedule(function()
            require("codediff.ui.view.compact").enable(tabpage)
        end)
    end,
})
