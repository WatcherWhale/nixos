{ self, ... }:
{
  imports = [
    "${self}/modules/disko/encrypted-btrfs.nix"
    ./hardware-configuration.nix

    "${self}/modules/system"

    "${self}/modules/programs/steam.nix"
    "${self}/modules/programs/sunshine"

    "${self}/modules/programs/docker.nix"
    "${self}/modules/programs/flatpak.nix"
  ];

  networking.hostName = "hammerhead";

  services.xserver = {
    xkb.layout = "be";
    xkbVariant = "nodeadkeys";
  };

  # DO NOT TOUCH
  system.stateVersion = "24.05";
}
