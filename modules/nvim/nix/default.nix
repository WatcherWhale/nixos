{
  pkgs,
  nvimInputs,
  ...
}:
let
  toPlugin =
    { name, plugin }:
    pkgs.vimUtils.buildVimPlugin {
      name = "${name}";
      source = plugin;
    };
in
{
  # Load all lua files
  xdg.configFile."nvim/lua".source = ./lua;

  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = # lua
      '''';

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

      toPlugin {name = "git-worktree-nvim"; plugin = nvimInputs.git-worktree-nvim; }
    ];

    extraPackages = with pkgs; [
      jdt-language-server
    ];
  };
}
