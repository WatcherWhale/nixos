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
}

for server, settings in pairs(servers) do
    lspconfig[server].setup(settings)
end
