{ config, pkgs, ... }:
  let
    user = "watcherwhale";
    homePath = "/home/${user}";
  in
{
  imports = [
    ../../homeManager/default.nix
    ../../homeManager/devops.nix
  ];

  home.username = user;
  home.homeDirectory = homePath;

  home.packages = with pkgs; [
    discord
  ];

  home.stateVersion = "24.05";
}
