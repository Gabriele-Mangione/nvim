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
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lspconfig.clangd.setup {}
vim.lsp.set_log_level("debug");

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        client.server_capabilities.semanticTokensProvider = nil
    end

});

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lspconfig.arduino_language_server.setup({
    capabilities = {
        general = {
            positionEncodings = { "utf-16" }
        },
        textDocument = {
            callHierarchy = {
                dynamicRegistration = false
            },
            codeAction = {
                codeActionLiteralSupport = {
                    codeActionKind = {
                        valueSet = { "", "Empty", "QuickFix", "Refactor", "RefactorExtract", "RefactorInline", "RefactorRewrite", "Source", "SourceOrganizeImports", "quickfix", "refactor", "refactor.extract", "refactor.inline", "refactor.rewrite", "source", "source.organizeImports" }
                    }
                },
                dataSupport = true,
                dynamicRegistration = true,
                isPreferredSupport = true,
                resolveSupport = {
                    properties = { "edit" }
                }
            },
            completion = {
                completionItem = {
                    commitCharactersSupport = false,
                    deprecatedSupport = false,
                    documentationFormat = { "markdown", "plaintext" },
                    preselectSupport = false,
                    snippetSupport = false
                },
                completionItemKind = {
                    valueSet = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25 }
                },
                contextSupport = false,
                dynamicRegistration = false
            },
            declaration = {
                linkSupport = true
            },
            definition = {
                dynamicRegistration = true,
                linkSupport = true
            },
            diagnostic = {
                dynamicRegistration = false
            },
            documentHighlight = {
                dynamicRegistration = false
            },
            documentSymbol = {
                dynamicRegistration = false,
                hierarchicalDocumentSymbolSupport = true,
                symbolKind = {
                    valueSet = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26 }
                }
            },
            formatting = {
                dynamicRegistration = true
            },
            hover = {
                contentFormat = { "markdown", "plaintext" },
                dynamicRegistration = true
            },
            implementation = {
                linkSupport = true
            },
            inlayHint = {
                dynamicRegistration = true,
                resolveSupport = {
                    properties = { "textEdits", "tooltip", "location", "command" }
                }
            },
            publishDiagnostics = {
                dataSupport = true,
                relatedInformation = true,
                tagSupport = {
                    valueSet = { 1, 2 }
                }
            },
            rangeFormatting = {
                dynamicRegistration = true
            },
            references = {
                dynamicRegistration = false
            },
            rename = {
                dynamicRegistration = true,
                prepareSupport = true
            },
            semanticTokens = vim.NIL,
            signatureHelp = {
                dynamicRegistration = false,
                signatureInformation = {
                    activeParameterSupport = true,
                    documentationFormat = { "markdown", "plaintext" },
                    parameterInformation = {
                        labelOffsetSupport = true
                    }
                }
            },
            synchronization = {
                didSave = true,
                dynamicRegistration = false,
                willSave = true,
                willSaveWaitUntil = true
            },
            typeDefinition = {
                linkSupport = true
            }
        },
        window = {
            showDocument = {
                support = true
            },
            showMessage = {
                messageActionItem = {
                    additionalPropertiesSupport = false
                }
            },
            workDoneProgress = true
        },
        workspace = {
            applyEdit = true,
            configuration = true,
            didChangeConfiguration = {
                dynamicRegistration = false
            },
            didChangeWatchedFiles = {
                dynamicRegistration = true,
                relativePatternSupport = true
            },
            inlayHint = {
                refreshSupport = true
            },
            semanticTokens = vim.NIL,
            symbol = {
                dynamicRegistration = false,
                symbolKind = {
                    valueSet = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26 }
                }
            },
            workspaceEdit = {
                resourceOperations = { "rename", "create", "delete" }
            },
            workspaceFolders = true
        }
    },
    --[[
    on_new_config = function (config, root_dir)
        config.capabilities.textDocument.semanticTokens = vim.NIL
        config.capabilities.workspace.semanticTokens = vim.NIL
    end,
    ]]
	cmd = {
		"arduino-language-server",
        "-clangd", "C:/Users/i00204438/AppData/Local/Programs/clangd_16.0.2/bin/clangd.exe",
        "-cli", "C:/Users/i00204438/AppData/Local/Programs/arduino-cli_0.33.1_Windows_32bit/arduino-cli.exe",
		"-cli-config", "C:/Users/i00204438/AppData/Local/Arduino15/arduino-cli.yaml",
        "fqbn", "esp32:esp32s3"
	}
})

lsp.setup()
