{ lib, ... }:
{
  programs.alacritty = {
    enable = lib.mkDefault true;
    settings = {
      shell = {
        program = "zellij";
      };

      env = {
        TERM = "alacritty";
      };

      font = {
        size = 16;
        normal = {
          family = "FiraCode Nerd Font Mono";
        };
      };

      window = {
        opacity = 1;
        dynamic_padding = true;
        padding = {
          x = 10;
          y = 10;
        };
      };

      colors = {
        primary = {
          background = "#2e3440";
          foreground = "#d8dee9";
        };

        bright = {
          black = "#4c566a";
          blue = "#81a1c1";
          cyan = "#8fbcbb";
          green = "#a3be8c";
          magenta = "#b48ead";
          red = "#bf616a";
          white = "#eceff4";
          yellow = "#ebcb8b";
        };

        cursor = {
          cursor = "#d8dee9";
          text = "#2e3440";
        };

        normal = {
          black = "#3b4252";
          blue = "#81a1c1";
          cyan = "#88c0d0";
          green = "#a3be8c";
          magenta = "#b48ead";
          red = "#bf616a";
          white = "#e5e9f0";
          yellow = "#ebcb8b";
        };

        footer_bar = {
          background = "#434c5e";
          foreground = "#d8dee9";
        };

        search.matches = {
          background = "#88c0d0";
          foreground = "CellBackground";
        };

        selection = {
          background = "#4c566a";
          text = "CellForeground";
        };

        vi_mode_cursor = {
          cursor = "#d8dee9";
          text = "#2e3440";
        };

      };
    };
  };

}
