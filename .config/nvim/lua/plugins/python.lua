if lazyvim_docs then
    -- LSP Server to use for Python.
    -- Set to "basedpyright" to use basedpyright instead of pyright.
    vim.g.lazyvim_python_lsp = "basedpyright"
    vim.g.lazyvim_python_ruff = "ruff"
end

local lsp = vim.g.lazyvim_python_lsp or "basedpyright"
local ruff = vim.g.lazyvim_python_ruff or "ruff"

return {
    recommended = function()
        return LazyVim.extras.wants({
            ft = "python",
            root = {
                "pyproject.toml",
                "setup.py",
                "setup.cfg",
                "requirements.txt",
                "Pipfile",
                "pyrightconfig.json",
            },
        })
    end,

    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                basedpyright = {
                    settings = {
                        basedpyright = {
                            analysis = {
                                typeCheckingMode = "standard",
                                autoSearchPaths = false,
                                inlayHints = {
                                    variableTypes = false,
                                    callArgumentNames = false,
                                },
                            },
                        },
                    },
                },
            },
        },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = { ensure_installed = { "ninja", "rst" } },
    },

    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                ruff = {
                    cmd_env = { RUFF_TRACE = "messages" },
                    init_options = {
                        settings = {
                            logLevel = "error",
                        },
                    },
                    keys = {
                        {
                            "<leader>co",
                            LazyVim.lsp.action["source.organizeImports"],
                            desc = "Organize Imports",
                        },
                    },
                },
            },
            setup = {
                [ruff] = function()
                    LazyVim.lsp.on_attach(function(client, _)
                        -- Disable hover in favor of Pyright
                        client.server_capabilities.hoverProvider = false
                    end, ruff)
                end,
            },
        },
    },

    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            local servers = { "pyright", "basedpyright", "ruff", "ruff_lsp", ruff, lsp }
            for _, server in ipairs(servers) do
                opts.servers[server] = opts.servers[server] or {}
                opts.servers[server].enabled = server == lsp or server == ruff
            end
        end,
    },

    {
        "linux-cultist/venv-selector.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            {
                "nvim-telescope/telescope.nvim",
                branch = "0.1.x",
                dependencies = { "nvim-lua/plenary.nvim" },
            }, -- optional: you can also use fzf-lua, snacks, mini-pick instead.
        },
        ft = "python", -- Load when opening Python files
        keys = {
            { ",v", "<cmd>VenvSelect<cr>" }, -- Open picker on keymap
        },
        opts = { -- this can be an empty lua table - just showing below for clarity.
            search = {}, -- if you add your own searches, they go here.
            options = {}, -- if you add plugin options, they go here.
        },
    },
}
