return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { "prettier/vim-prettier" },
        { "williamboman/nvim-lsp-installer" },
        { 'hrsh7th/nvim-cmp' },     -- Required
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        { 'L3MON4D3/LuaSnip' },     -- Required
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
    },
    config = function()
        require("mason").setup();
        local lspconfig = require('lspconfig')
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "clangd",
                "arduino_language_server"
            },
            handlers = {
                function(server_name)
                    lspconfig[server_name].setup { capabilities = require("cmp_nvim_lsp").default_capabilities() }
                end,
                --special config
                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup {
                        settings = {
                            Lua = {
                                runtime = {
                                    version = "LuaJIT"
                                },
                                diagnostics = {
                                    globals = {
                                        "vim",
                                        "require"
                                    }
                                }
                            }
                        }
                    }
                end,
                ["arduino_language_server"] = function()
                    lspconfig.arduino_language_server.setup {
                        cmd = {
                            "arduino-language-server",
                            "-clangd", "C:/Users/i00204438/AppData/Local/Programs/clangd_16.0.2/bin/clangd.exe",
                            "-cli", "C:/Users/i00204438/AppData/Local/Programs/arduino-cli_0.33.1_Windows_32bit/arduino-cli.exe",
                            "-cli-config", "C:/Users/i00204438/AppData/Local/Arduino15/arduino-cli.yaml",
                            "fqbn", "esp32:esp32s3"
                        },
                        textDocument = {
                            semanticTokens = vim.NIL
                        },
                        workspace = {
                            semanticTokens = vim.NIL
                        }
                    }
                end
            }
        })

        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
                ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" }
            }, {
                { name = "buffer" }
            })
        })
    end
}
