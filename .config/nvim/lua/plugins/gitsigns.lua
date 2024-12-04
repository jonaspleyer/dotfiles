return {
    "lewis6991/gitsigns.nvim",
    ft = "gitsigns",
    lazy = false,
    opts = {
        numhl = true,
        signcolumn = false,
    },
    init = function()
        vim.api.nvim_set_hl(0, "GitSignsAddLn", { link = "GitSignsChangeLn" })
    end,
}
