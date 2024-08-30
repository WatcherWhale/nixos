{ self, ... }:
  let
    user = "work";
    homePath = "/home/${user}";
  in
{
  imports = [
    "${self}/modules/home-manager"
  ];

  home.username = user;
  home.homeDirectory = homePath;

  home.stateVersion = "24.05";
}
