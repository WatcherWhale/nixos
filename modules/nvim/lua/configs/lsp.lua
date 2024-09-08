local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')
local util = require('lspconfig/util')

local get_on_attach = function(server)
    return function(client, bufnr, ignore)
        --vim.api.nvim_echo(server)
        vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
            vim.lsp.buf.format()
            vim.cmd("norm! zz")
        end, { desc = 'Format current buffer with LSP' })

        --vim.lsp.buf.format()
        --vim.cmd("norm! zz")
    end
end
local on_attach = function(client, bufnr, ignore)
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
        vim.cmd("norm! zz")
    end, { desc = 'Format current buffer with LSP' })

    --vim.lsp.buf.format()
    --vim.cmd("norm! zz")
end

local servers = {
    gopls = {
        filetypes = { "go", "gomod" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        on_attach = on_attach,
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
    --tsserver = {},
    bashls = {},
    jsonnet_ls = {},
    lua_ls = {},
    rust_analyzer = {},
    elixirls = {},
    dockerls = {},
    golangci_lint_ls = {},
    gradle_ls = {},
    jqls = {},
    kotlin_language_server = {},
    --jdtls = {},
    angularls = {},
    ansiblels = {},
    pylsp = {
        disable_format = true,
        settings = {
            pylsp = {
                plugins = {
                    mccabe = {
                        enabled = false,
                    },
                    flake8 = {
                        enabled = false,
                    },
                    autopep8 = {
                        enabled = false,
                    },
                    pycodestyle = {
                        enabled = false
                    },
                    pyflakes = {
                        enabled = false
                    },
                    yapf = {
                        enabled = false
                    },
                }
            }
        },
    },
    emmet_language_server = {},
    nil_ls = {
        formatting = {
            command = { "nixfmt" },
        },
    },
}

local additional_tools = {
    "yamllint",
    "gitleaks",
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

local setup_server = function(server_name)
    local server = servers[server_name] or {}
    server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
    server.on_attach = get_on_attach(server)
    require('lspconfig')[server_name].setup(server)
end

require('mason').setup()

local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, additional_tools)
require('mason-tool-installer').setup { ensure_installed = ensure_installed }
require('mason-lspconfig').setup({
    handlers = {
        setup_server
    }
})

require('neodev').setup()
require("lsp-format").setup {}
