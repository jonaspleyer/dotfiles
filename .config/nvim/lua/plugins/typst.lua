return {
    -- requires tinymist
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "typst",
            },
        },
    },
    -- add tinymist to lspconfig
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                tinymist = {
                    keys = {
                        {
                            "<leader>cP",
                            function()
                                local buf_name = vim.api.nvim_buf_get_name(0)
                                local file_name = vim.fn.fnamemodify(buf_name, ":t")
                                LazyVim.lsp.execute({
                                    command = "tinymist.pinMain",
                                    arguments = { buf_name },
                                })
                                LazyVim.info("Tinymist: Pinned " .. file_name)
                            end,
                            desc = "Pin main file",
                        },
                    },
                    single_file_support = true, -- Fixes LSP attachment in non-Git directories
                    settings = {
                        formatterMode = "typstyle",
                    },
                },
            },
        },
    },
}
