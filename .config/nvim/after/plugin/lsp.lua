local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'rust_analyzer',
    "ruff",
    "basedpyright",
    "typst_lsp",
})

lsp.nvim_workspace()

lsp.on_attach(function(client, bufnr)
    local opts ={buffer = buffer, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    signs = false,
})

local lspconfig = require "lspconfig"
lspconfig.basedpyright.setup {
    settings = {
        basedpyright = {
            autoImportCompletion = true,
            analysis = {
                typeCheckingMode = "standard",
            },
        },
    }
}
