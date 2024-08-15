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

  home.sessionPath = [
    "${homePath}/.scripts"
  ];

  home.stateVersion = "24.05";
}
