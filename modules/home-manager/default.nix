{
  self,
  pkgs,
  config,
  ...
}@inputs:
{
  imports = [
    "${self}/modules/extra/allowUnfree.nix"

    ./autorandr.nix
    ./theming.nix
    ./dunst.nix
    ./zathura.nix

    ./picom.nix
    ./lockscreen.nix

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
  ];

  home.keyboard = {
    options = [ "caps:escape" ];
  };

  lockscreen.wallpaper = "${config.home.homeDirectory}/Pictures/Wallpapers/whaleshark.jpg";

  custom.programs.qtile.enable = true;
  custom.programs.qtile.autostart_always = pkgs.writeShellScriptBin "autostart_always" ''
    # sh -c '~/.scripts/notifications' &
    #sh -c '~/.scripts/picom.sh' &
    sh -c '~/.scripts/xob/start.sh' &
    #setxkbmap -option caps:escape &
    nitrogen --restore &
    #betterlockscreen -w &
    #sh -c '~/.scripts/wacom' &

    betterlockscreen -u ~/Nextcloud/Pictures/Posters/bw-whaleshark.jpg &
  '';

  # automatic garbace collection
  nix.gc = {
    automatic = true;
    frequency = "hourly";
    options = "--delete-older-than 7d";
  };

  xsession = {
    enable = true;
    initExtra = ''
      autorandr -c
      xset s off
      xset -dpms
    '';
    numlock.enable = true;
  };

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

  services.unclutter.enable = true;
  services.redshift = {
    enable = true;

    latitude = "51.26";
    longitude = "4.40";

    tray = true;

    temperature = {
      day = 6500;
      night = 4500;
    };
  };

  programs.git.enable = true;

  home.sessionPath = [
    "$HOME/.scripts"
    "$HOME/.local/bin"
  ];

  home.sessionVariables = {
    BROWSER = "firefox";
    DIFFPROG = "nvim -d";
    BAT_THEME = "Nord";
    EDITOR = "nvim";
    GOPATH = "$HOME/.local/go";
    SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/keyring/ssh";
  };

  programs.home-manager.enable = true;

  services.gnome-keyring = {
    enable = true;
    components = [ "ssh" ];
  };
}
