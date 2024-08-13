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
  ];

  programs.git.enable = true;

  programs.firefox = {
    enable = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
