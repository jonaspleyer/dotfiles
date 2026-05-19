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
                            lineLength = "100",
                        },
                    },
                },
                ruff_lsp = {},
            },
            setup = {
                [ruff] = function()
                    Snacks.util.lsp.on({ name = ruff }, function(_, client)
                        -- Disable hover in favor of Pyright
                        client.server_capabilities.hoverProvider = false
                    end)
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
        cmd = "VenvSelect",
        opts = {
            options = {
                notify_user_on_venv_activation = true,
                override_notify = false,
            },
        },
        --  Call config for Python files and load the cached venv automatically
        ft = "python",
        keys = {
            { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv", ft = "python" },
        },
    },
}
