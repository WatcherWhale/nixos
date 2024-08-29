{ config, pkgs, ... }:
  let
    user = "watcherwhale";
    homePath = "/home/${user}";
  in
{
  imports = [
    ../../modules/homeManager/default.nix
    ../../modules/homeManager/devops.nix

    ../../modules/programs/dungeondraft/home-manager.nix
    ../../modules/programs/wonderdraft/home-manager.nix
  ];

  home.username = user;
  home.homeDirectory = homePath;


  home.packages = with pkgs; [
    discord
    modrinth-app
  ];

  home.stateVersion = "24.05";
}
