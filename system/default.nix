{ config, lib, pkgs, ... }:
{
  imports = [
    ./packages.nix
    ./xserver.nix
    ./sound.nix
  ];

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
  };

  # Enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Europe/Brussels";

  hardware.bluetooth.enable = true;

  services = {
    ntp.enable = true;
    blueman.enable = true;
  };

  services.openssh.enable = true;
  networking = {
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 ];
    };
  };

  # DO NOT TOUCH
  system.stateVersion = "24.05";
}
