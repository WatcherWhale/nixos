{ pkgs, ... }:
{
  imports = [
    ./autorandr.nix
    ./shell.nix
    ./theming.nix
    ./dunst.nix
    ./browser.nix
  ];

  # automatic garbace collection
  nix.gc = {
    automatic = true;
    frequency = "hourly";
    options = "--delete-older-than 14d";
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
    eza
    stow
    zellij
    rofi
    zoxide
    ranger
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
    nixfmt-rfc-style
  ];

  services.unclutter.enable = true;
  services.flameshot.enable = true;
  services.redshift = {
    enable = true;

    latitude = "51.26";
    longitude = "4.40";

    tray = true;

    temperature= {
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
    EDITOR = "nvim";
    GOPATH = "$HOME/.local/go";
    SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/keyring/ssh";
  };

  programs.home-manager.enable = true;

  services.gnome-keyring = {
    enable = true;
    components = [
      "ssh"
    ];
  };
}
