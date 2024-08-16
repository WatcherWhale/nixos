{ config, pkgs, ... }:
  let
    user = "work";
    homePath = "/home/${user}";
  in
{
  imports = [
    ../../homeManager/default.nix
    ../../homeManager/devops.nix
  ];

  home.username = user;
  home.homeDirectory = homePath;

  home.stateVersion = "24.05";
}
