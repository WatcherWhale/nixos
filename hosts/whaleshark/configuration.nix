{ ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "whaleshark";

  services.hardware.openrgb.enable = true;

  # DO NOT TOUCH
  system.stateVersion = "24.05";
}
