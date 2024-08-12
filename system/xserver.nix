{ config, lib, pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.windowManager.qtile = {
    enable = true;
    extraPackages = python3Packages : with python3Packages; [
      pyautogui
    ];
  };

  services.xserver  = {
    libinput.enable = true;
    xkb = {
      layout = "us";
      options = "eurosign:e,caps:escape";
    };
  };
}
