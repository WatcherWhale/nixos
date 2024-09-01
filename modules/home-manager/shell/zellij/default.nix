{ pkgs, ... }:
{
  imports = [
    ./config.nix
    ./layouts
    ./plugins
  ];

  home.packages = with pkgs; [
    zellij
  ];
}
