{config, pkgs, ...}: 
{
  imports = [
    ../../homeManager/default.nix
    ../../homeManager/kubernetes.nix
    ../../homeManager/steam.nix
  ];

  home.username = "watcherwhale";
  home.homeDirectory = "/home/watcherwhale";

  home.packages = with pkgs; [
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}
