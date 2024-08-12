{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./steam.nix
  ];

  networking.hostName = "whaleshark";

  # DO NOT TOUCH
  system.stateVersion = "24.05";
}
