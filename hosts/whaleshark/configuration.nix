{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./steam.nix
  ];

  environment.systemPackages = with pkgs; [
    i2c-tools
    liquidctl
  ];

  services.hardware.openrgb = {
    enable = false;
    motherboard = "amd";
  };

  networking.hostName = "whaleshark";

  # DO NOT TOUCH
  system.stateVersion = "24.05";
}
