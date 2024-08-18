{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/programs/steam.nix
    ../../modules/programs/sunshine.nix
  ];

  networking.hostName = "whaleshark";

  programs.sunshine.enable = true;

  # DO NOT TOUCH
  system.stateVersion = "24.05";
}
