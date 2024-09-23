{ pkgs, ... }@inputs:
{
  home.packages = [
    (import ./package.nix inputs)
  ];
}
