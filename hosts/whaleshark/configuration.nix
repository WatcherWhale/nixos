{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./steam.nix
  ];

  environment.systemPackages = with pkgs; [
  ];

  networking.hostName = "whaleshark";

  # DO NOT TOUCH
  system.stateVersion = "24.05";
}
