{ pkgs, inputs, ... }:
{
  imports = [
    ./config.nix
    ./layouts
    ./plugins
  ];

  home.packages = with pkgs; [
    zellij

    inputs.zellij-store.packages.${system}.default
  ];
}
