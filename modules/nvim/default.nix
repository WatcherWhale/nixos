{
  pkgs,
  ...
}:
{
  # Load all lua files
  xdg.configFile."nvim/lua".source = ./lua;

  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = # lua
      ''
        require("configs/setup")
        require("configs/keybinds")
        require("configs/commands")
        require("configs/theming")
        require("configs/telescope")
        require("configs/lsp")
        require("configs/treesitter")
        require("configs/cmp")
        require("configs/harpoon")

        -- Disable case sensitivity
        vim.o.ignorecase = true
        -- Enable case sensitivity if search contains uppercase
        vim.o.smartcase = true


        -- Share Clipboard
        vim.opt.clipboard = 'unnamedplus'


        -- Set Tabs to 4 spaces
        vim.o.tabstop = 4
        vim.o.expandtab = true
        vim.o.softtabstop = 4
        vim.o.shiftwidth = 4

        -- Disable Mouse Actions
        vim.o.mouse = ""
      '';

    plugins = with pkgs.vimPlugins; [
      # Utils
      plenary-nvim

      # Theming
      nord-nvim
      lualine-nvim
      nvim-web-devicons

      # Git
      vim-fugitive
      gitsigns-nvim
      neogit
      diffview-nvim
      git-blame-nvim

      # Telescope
      telescope-nvim
      telescope-file-browser-nvim

      noice-nvim
      nui-nvim
      nvim-notify

      nvim-treesitter.withAllGrammars
      nvim-treesitter-textobjects
      nvim-treesitter-parsers.helm

      rainbow-delimiters-nvim

      nvim-lspconfig
      fidget-nvim
      nvim-jdtls
      lsp-format-nvim

      lazydev-nvim

      vim-wordmotion

      markdown-preview-nvim

      nvim-surround
      #vim-surround
      vim-commentary

      trouble-nvim

      harpoon2

      which-key-nvim

      oil-nvim

      undotree

      stay-centered-nvim
      comment-nvim

      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      luasnip
      cmp_luasnip
      friendly-snippets
    ];

    extraPackages = with pkgs; [
      jdt-language-server
      gopls
      yaml-language-server
      helm-ls
      terraform-ls
      nodePackages_latest.vscode-json-languageserver
      bash-language-server
      lua-language-server
      nil
    ];
  };
}
