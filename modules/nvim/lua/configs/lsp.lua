local lspconfig = require('lspconfig')

local servers = {
    gopls = {
        settings = {
            gopls = {
                analyses = {
                    unusedparams = true,
                },
                staticcheck = true,
            },
        },
    },
    helm_ls = {
        filetypes = { 'helm' },
        settings = {
            ['helm-ls'] = {
                yamlls = {
                    path = "yaml-language-server",
                }
            }
        },
    },
    yamlls = {},
    terraformls = {},
    jsonls = {},
    bashls = {},
    lua_ls = {},
    dockerls = {},
    golangci_lint_ls = {},
    nixd = {},
    -- nil_ls = {
    --     formatting = {
    --         command = { "nixfmt" },
    --     },
    --     settings = {
    --         nix = {
    --             flake = {
    --                 autoArchive = true
    --             }
    --         }
    --     }
    -- },
    jqls = {},
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

for server, settings in pairs(servers) do
    settings.capabilities = vim.tbl_deep_extend('force', {}, capabilities, settings.capabilities or {})
    settings.on_attach = require("lsp-format").on_attach
    lspconfig[server].setup(settings)
end

require("lsp-format").setup {}
