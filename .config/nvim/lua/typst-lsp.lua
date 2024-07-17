lspconfig = require "lspconfig"

lspconfig.typst_lsp.setup {
    settings = {
        exportPdf = "onSave"
    }
}

