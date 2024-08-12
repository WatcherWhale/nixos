{ ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "whaleshark";

  # DO NOT TOUCH
  system.stateVersion = "24.05";
}
