{ pkgs, ... }:
{
  imports = [
    ./shell.nix
  ];

  home.packages = with pkgs; [
    eza
    stow
    zellij
    flameshot
    rofi
    dunst
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
