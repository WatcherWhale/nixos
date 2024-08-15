{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    neovim
    curl
    fish
    git
    fzf
    jq
    acpi
    killall
    htop
    unzip
    gcc
    home-manager
    picom
    pavucontrol
    gnome-keyring
    xclip
    seahorse
    numlockx
  ];

  fonts.packages = with pkgs; [
    nerdfonts
    fira-code-nerdfont
  ];

  system.activationScripts.binbash = {
    deps = ["binsh"];
    text = ''
      ln -sf /bin/sh /bin/bash
    '';
  };

  services.greenclip.enable = true;
}
