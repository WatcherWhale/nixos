{ inputs, pkgs, ... }:
{
  imports = [
    ./firefox.nix
  ];

  home.packages = with pkgs; [
    brave
    inputs.zen-browser.packages."${system}".specific
  ];
}
