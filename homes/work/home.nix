{ self, config, pkgs, ... }:
  let
    user = "work";
    homePath = "/home/${user}";
  in
{
  imports = [
    ../../modules/homeManager/default.nix
    ../../modules/homeManager/devops.nix
  ];

  home.username = user;
  home.homeDirectory = homePath;

  home.stateVersion = "24.05";
}
