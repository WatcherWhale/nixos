{
  self,
  pkgs,
  config,
  ...
}@inputs:
{
  programs.home-manager.enable = true;

  imports = [
    ./session.nix
    ./packages.nix
    ./autorandr.nix
    ./theming.nix
    ./dunst.nix
    ./zathura.nix

    ./picom.nix
    ./lockscreen.nix
    ./redshift.nix

    ./git.nix

    ./devops
    ./shell
    ./browser
    ./mpv
    ./lf
    ./ranger
    ./qtile
    ./nvim

    ./flameshot.nix
    ./xob

    ./gpg.nix
    ./pass.nix
  ];

  lockscreen.wallpaper = "${config.home.homeDirectory}/Pictures/Wallpapers/whaleshark.jpg";

  custom.programs.qtile.enable = true;
  custom.programs.qtile.autostart_always = pkgs.writeShellScriptBin "autostart_always" ''
    sh -c '~/.scripts/xob/start.sh' &
    nitrogen --restore &

    betterlockscreen -u ~/Nextcloud/Pictures/Posters/bw-whaleshark.jpg &
  '';

  # automatic garbace collection
  nix.gc = {
    automatic = true;
    frequency = "hourly";
    options = "--delete-older-than 7d";
  };

  services.unclutter.enable = true;
  xsession = {
    enable = true;
    initExtra = ''
      autorandr -c
      xset s off
      xset -dpms
    '';
    numlock.enable = true;
  };

  services.gnome-keyring = {
    enable = true;
    components = [ "ssh" ];
  };
}
