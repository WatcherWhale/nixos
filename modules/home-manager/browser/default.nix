{ inputs, pkgs, ... }:
{
  imports = [
    ./firefox.nix
    ./pwa.nix
  ];

  home.packages = with pkgs; [
    brave
    inputs.zen-browser.packages."${system}".specific
  ];
}
