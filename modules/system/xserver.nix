{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.xserver = {
    enable = true;

    windowManager.qtile = {
      enable = true;
      extraPackages =
        python3Packages: with python3Packages; [
          pyautogui
        ];
    };

    xkb = {
      layout = "us";
      options = "eurosign:e,caps:escape";
    };

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
