{ pkgs, ... }:
{
  gtk = {
    enable = true;

    font = {
      name = "NotoSans Nerd Font";
      size = 14;
    };

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
}
