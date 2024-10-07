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
                      path = "${pkgs.yaml-language-server}/bin/yaml-language-server",
                  }
              }
          },
      },
      yamlls = {},
      terraformls = {},
      jsonls = {
        cmd = { "${pkgs.nodePackages_latest.vscode-json-languageserver}/bin/vscode-json-languageserver", "--stdio" },
      },
      bashls = {},
      lua_ls = {},
      dockerls = {},
      golangci_lint_ls = {},
      nixd = {
          formatting = {
              command = { "${pkgs.nixfmt-rfc-style}/bin/nixfmt" },
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
