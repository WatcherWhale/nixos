{
  config,
  lib,
  pkgs,
  ...
}:
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
    xclip
    seahorse
    numlockx
    polkit_gnome
    wget
    openssl

    (pkgs.writeShellScriptBin "nix-repair-store" ''
      sudo nix-store --verify --check-contents --repair
    '')
  ];

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  fonts.packages = with pkgs; [
    nerdfonts
    fira-code-nerdfont
  ];

  system.activationScripts.binbash = {
    deps = [ "binsh" ];
    text = ''
      ln -sf /bin/sh /bin/bash
    '';
  };

  services.greenclip.enable = true;
  services.dbus.packages = [ pkgs.gcr ];
}
