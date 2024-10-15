{ pkgs, stablePkgs, ... }:
{

  home.packages = with pkgs; [
    nh
    dig
    doggo
    eza
    stow
    rofi
    nitrogen
    bat
    thunderbird
    networkmanagerapplet
    rofi-bluetooth
    qalculate-gtk
    calc
    trash-cli
    libarchive
    viddy
    ripgrep
    fd
    yt-dlp
    devour
  ];
}
