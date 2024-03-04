return {

    { "MunifTanjim/nui.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim", tag = '0.1.2' },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require ("nvim-treesitter.configs").setup {
                -- A list of parser names, or "all" (the five listed parsers should always be installed)
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "cpp", "rust" },
                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,
                highlight = {
                    enable = true,

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
            }
        end
    },
    { "mbbill/undotree" },
    { "tpope/vim-endwise" },
    { 'Bekaboo/deadcolumn.nvim' },
    {
        "romgrk/barbar.nvim",
        dependencies = {
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            animation = true,

        },
        version = "^1.0.0",
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        config = function()
            require("neo-tree").setup({
                close_if_last_window = true,
                enable_git_status = true,
                enable_diagnostics = true,
                default_component_configs = {

                },
                window = {
                    position = "right",
                    width = 30,
                    mapping_options = {
                        noremap = true,
                    },
                    mappings = {

                    },
                    filesystem = {
                        filtered_items = {
                            visible = true,
                        }
                    }
                }
            })
            vim.cmd([[:Neotree]])
        end
    },
}
