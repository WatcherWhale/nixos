{ pkgs, ... }:
{
  imports = [
    ./autorandr.nix
    ./shell.nix
    ./theming.nix
    ./browser.nix
  ];
  xsession.enable = true;

  home.packages = with pkgs; [
    eza
    stow
    zellij
    rofi
    dunst
    zoxide
    direnv
    ranger
    nitrogen
    bat
    thunderbird
    numlockx
    networkmanagerapplet
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
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    GOPATH = "~/.local/go";
  };

  programs.home-manager.enable = true;
}
