{
  self,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    "${self}/modules/extra/allowUnfree.nix"

    ./packages.nix
    ./xserver.nix
    ./sound.nix
  ];

  # automatic garbace collection
  nix.gc = {
    automatic = true;
    dates = "hourly";
    options = "--delete-older-than 14d";
  };

  # Enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Europe/Brussels";

  hardware.bluetooth.enable = true;

  services = {
    ntp.enable = true;
    blueman.enable = true;
  };

  programs.dconf.enable = true;

  services.openssh.enable = true;
  networking = {
    networkmanager.enable = true;
    useDHCP = lib.mkDefault true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 ];
    };
  };

  programs.appimage.binfmt = true;

  programs.nix-ld = {
    enable = true;
    libraries =
      with pkgs;
      [
      ];
  };

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.lightdm.enableGnomeKeyring = true;
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}
