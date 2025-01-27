vim.api.nvim_create_autocmd({
    "BufNewFile",
    "BufRead",
}, {
    pattern = "*.typ",
    callback = function()
        local buf = vim.api.nvim_get_current_buf()
        vim.api.nvim_set_option_value("filetype", "typst", { buf = buf })
        vim.api.nvim_set_option_value("filetype", "wgsl", { buf = buf })
    end,
})
