{ config, lib, pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.windowManager.qtile = {
    enable = true;
    extraPackages = python3Packages : with python3Packages; [
      pyautogui
    ];
  };

  services.libinput.enable = true;
  services.xserver  = {
    xkb = {
      layout = "us";
      options = "eurosign:e,caps:escape";
    };
  };
}
