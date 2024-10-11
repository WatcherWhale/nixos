{ inputs, pkgs, ... }:
{
  imports = [
    ./firefox.nix
    ./pwa.nix
    ./open-in
  ];

  home.packages = with pkgs; [
    brave
    inputs.zen-browser.packages."${system}".specific
  ];
}
