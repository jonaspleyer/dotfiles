-- Require LSP config which we can use to attach rust-analyzer
lspconfig = require "lspconfig"
util = require "lspconfig/util"

lspconfig.rust_analyzer.setup {
}

