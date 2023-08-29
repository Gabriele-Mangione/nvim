local lsp = require("lsp-zero")
local lspconfig = require('lspconfig')
lsp.preset('recommended')
lsp.ensure_installed({
	'clangd',
    'rust_analyzer',
	'arduino_language_server',
    'lua_ls',
})

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
	["<Tab>"] = cmp.mapping.confirm({select = true}),
	["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lspconfig.arduino_language_server.setup({
	cmd = {
		"arduino-language-server",
        "-clangd", "C:/Users/i00204438/AppData/Local/Programs/clangd_16.0.2/bin/clangd.exe",
        "-cli", "C:/Users/i00204438/AppData/Local/Programs/arduino-cli_0.33.1_Windows_32bit/arduino-cli.exe",
		"-cli-config", "C:/Users/i00204438/AppData/Local/Arduino15/arduino-cli.yaml",
		"-fqbn", "esp32:esp32:esp32s3",
	}
})

lsp.setup()
