{config, pkgs, ...}: 
{
  imports = [
    ../../homeManager/default.nix
    ../../homeManager/devops.nix
  ];

  home.username = "watcherwhale";
  home.homeDirectory = "/home/watcherwhale";

  home.packages = with pkgs; [
    discord
  ];

  home.stateVersion = "24.05";
}
