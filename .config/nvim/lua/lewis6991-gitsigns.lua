vim.api.nvim_set_hl(0, 'GitSignsAddLn', { link = 'GitSignsChangeLn' })

require('gitsigns').setup {
    numhl = true,
    -- linehl = true,
    signcolumn = false,
}
