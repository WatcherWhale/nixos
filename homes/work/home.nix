{ self, ... }:
  let
    user = "work";
    homePath = "/home/${user}";
  in
{
  imports = [
    "${self}/modules/homeManager"
  ];

  home.username = user;
  home.homeDirectory = homePath;

  home.stateVersion = "24.05";
}
