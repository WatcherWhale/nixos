{ pkgs, ... }:
{
  imports = [
    ./shell.nix
  ];

  home.packages = with pkgs; [
    zellij
    alacritty
  ];

  programs.git.enable = true;

  programs.firefox = {
    enable = true;
  };
}
