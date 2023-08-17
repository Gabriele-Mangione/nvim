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
        {"EdenEast/nightfox.nvim"},
        {"VonHeikemen/lsp-zero.nvim", dependencies = {
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }},
        {"nvim-neo-tree/neo-tree.nvim"},
        {"MunifTanjim/nui.nvim"},
        {"nvim-lua/plenary.nvim"},
        {"nvim-tree/nvim-web-devicons"},
        {"williamboman/nvim-lsp-installer"},
        {"nvim-telescope/telescope.nvim", tag = '0.1.2', dependencies = { "nvim-lua/plenary.nvim" }},
        {"nvim-treesitter/nvim-treesitter"},
        {"mbbill/undotree"},
        {"bedware/vim-arduino", branch = "windows_support"}
    }
})


require("gab")
