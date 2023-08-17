local lsp = require("lsp-zero")
local lspconfig = require('lspconfig')
lsp.preset('recommended')
lsp.ensure_installed({
	'clangd',
	'arduino_language_server',
})

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-l>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-h>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-ö>"] = cmp.mapping.confirm({select = true}),
	["<C-Space>"] = cmp.mapping.complete(),
})

lspconfig.arduino_language_server.setup({
	cmd = {
		"arduino-language-server",
		"-cli-config",
		"C:/Users/i00204438/AppData/Local/Arduino15/arduino-cli.yaml",
		"-fqbn",
		"arduino:avr:uno",
	}
})


lsp.setup()
