{ pkgs, ... }:
{
  imports = [
    ./shell.nix
    ./theming.nix
  ];

  home.packages = with pkgs; [
    eza
    stow
    zellij
    flameshot
    rofi
    dunst
    zoxide
    direnv
    ranger
    nitrogen
    bat
  ];

  programs.git.enable = true;

  programs.firefox = {
    enable = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    GOPATH = "~/.local/go";
  };

  programs.home-manager.enable = true;
}
