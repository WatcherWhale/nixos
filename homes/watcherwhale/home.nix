{ self, pkgs, ... }:
  let
    user = "watcherwhale";
    homePath = "/home/${user}";
  in
{
  imports = [
    "${self}/modules/homeManager"

    "${self}/modules/programs/dungeondraft/home-manager.nix"
    "${self}/modules/programs/wonderdraft/home-manager.nix"
  ];

  home.username = user;
  home.homeDirectory = homePath;


  home.packages = with pkgs; [
    modrinth-app
  ];

  home.stateVersion = "24.05";
}
