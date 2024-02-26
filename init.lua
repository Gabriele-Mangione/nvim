local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
    spec = {
        { "EdenEast/nightfox.nvim" },
        { "williamboman/nvim-lsp-installer" },
        { 'neovim/nvim-lspconfig' },  
        { 'hrsh7th/nvim-cmp' },     -- Required
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        { 'L3MON4D3/LuaSnip' },     -- Required
        {
            "VonHeikemen/lsp-zero.nvim",
            dependencies = {
                { 'williamboman/mason.nvim' },
                { 'williamboman/mason-lspconfig.nvim' },


                -- Autocompletion
            }
        },
        { "nvim-neo-tree/neo-tree.nvim" },
        { "MunifTanjim/nui.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-tree/nvim-web-devicons" },
        { "nvim-telescope/telescope.nvim",  tag = '0.1.2', dependencies = { "nvim-lua/plenary.nvim" } },
        { "nvim-treesitter/nvim-treesitter" },
        { "mbbill/undotree" },
        { "tpope/vim-endwise" },
        { 'Bekaboo/deadcolumn.nvim' },
        { "nvim-tree/nvim-web-devicons" },
        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "MunifTanjim/nui.nvim",
            }
        },

        {
            "romgrk/barbar.nvim",
            dependencies = {
                "lewis6991/gitsigns.nvim",    --for git status
                "nvim-tree/nvim-web-devicons" --for file icons
            },
            init = function() vim.g.barbar_auto_setup = false end,
            opts = {
                animation = false,

            },
            version = "^1.0.0",
        },
    }
})


require("gab")
