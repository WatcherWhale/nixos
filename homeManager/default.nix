{ pkgs, ... }:
{
  imports = [
    ./shell.nix
    ./theming.nix
    ./browser.nix
  ];

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
  services.redshift.enable = true;

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
