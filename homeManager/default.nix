{ pkgs, ... }:
{
  imports = [
    ./shell.nix
    ./theming.nix
    ./browser.nix
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

  home.sessionVariables = {
    EDITOR = "nvim";
    GOPATH = "~/.local/go";
  };

  programs.home-manager.enable = true;
}
