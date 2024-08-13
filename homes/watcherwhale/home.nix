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

  gtk = {
    enable = true;
    theme = {
      name = "Nordic-bluish-accent";
      package = pkgs.nordic;
    };
  };

  home.stateVersion = "24.05";
}
