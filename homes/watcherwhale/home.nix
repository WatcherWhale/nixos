{ self, pkgs, ... }:
  let
    user = "watcherwhale";
    homePath = "/home/${user}";
  in
{
  imports = [
    "${self}/modules/homeManager"

    "${self}/modules/programs/dungeondraft"
    "${self}/modules/programs/wonderdraft"
  ];

  home.username = user;
  home.homeDirectory = homePath;


  home.packages = with pkgs; [
    modrinth-app
  ];

  home.stateVersion = "24.05";
}
