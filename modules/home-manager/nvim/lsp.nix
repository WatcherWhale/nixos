{ pkgs, ... }:
# lua
''
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
      nixd = {
          formatting = {
              command = { "nixfmt" },
          },
      },
      jqls = {},
      ts_ls = {},
      elixirls = {
          cmd = { "${pkgs.elixir-ls}/bin/elixir-ls" }
      },
  }

  require("configs/lsp").register_lsp(servers)
''
