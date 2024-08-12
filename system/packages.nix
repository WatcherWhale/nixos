{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    neovim
    curl
    fish
    git
    fzf
    autorandr
    jq
    acpi
    killall
    htop
    unzip
    gcc
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
}
