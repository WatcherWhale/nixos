local lspconfig = require('lspconfig')

local function register_lsp(servers)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    for server, settings in pairs(servers) do
        settings.capabilities = vim.tbl_deep_extend('force', {}, capabilities, settings.capabilities or {})
        settings.on_attach = require("lsp-format").on_attach
        lspconfig[server].setup(settings)
    end

    require("lsp-format").setup {}
end

return {
    register_lsp = register_lsp
}
