vim.filetype.add({
    filename = {
        ["config.conf"] = "mango",
    },
    pattern = {
        [".*/mango/.*%.conf"] = "mango",
    },
})
