{ config, lib, pkgs, ... }:
{
  services.xserver  = {
    enable = true;

    windowManager.qtile = {
      enable = true;
      extraPackages = python3Packages : with python3Packages; [
        pyautogui
      ];
    };

    xkb = {
      layout = "us";
      options = "eurosign:e,caps:escape";
    };

    xrandrHeads = [
      {
        output = "DP-1";
        primary = true;
        monitorConfig = ''
          DisplaySize 2560 1440
          VertRefresh 74.92
          Option "PreferredMode" "2560x1440"
        '';
      }
      {
        output = "DP-2";
        monitorConfig = ''
          DisplaySize 2560 1440
          VertRefresh 74.92
          Option "RightOf" "DP-1"
          Option "PreferredMode" "2560x1440"
        '';
      }
      {
        output = "HDMI-1";
        monitorConfig = ''
          DisplaySize 1920 1080
          VertRefresh 60
          Option "LeftOf" "DP-1"
          Option "PreferredMode" "1920x1080"
        '';
      }
    ];

    displayManager.lightdm = {
      greeters.slick = {
        enable = true;
        theme = {
          name = "Nordic-bluish-accent";
          package = pkgs.nordic;
        };

        cursorTheme = {
          name = "phinger-cursors-dark";
          package = pkgs.phinger-cursors;
        };

        iconTheme = {
          name = "Flat-Remix-Blue-Dark";
          package = pkgs.flat-remix-icon-theme;
        };
      };
      greeters.gtk = {
        #enable = true;
        extraConfig = ''
          font-name = NotoSans Nerd Font 16
        '';
        theme = {
          name = "Nordic-bluish-accent";
          package = pkgs.nordic;
        };

        cursorTheme = {
          name = "phinger-cursors-dark";
          package = pkgs.phinger-cursors;
        };

        iconTheme = {
          name = "Flat-Remix-Blue-Dark";
          package = pkgs.flat-remix-icon-theme;
        };
      };
    };
  };

  services.libinput.enable = true;
}
