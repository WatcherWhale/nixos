{ ... }:
{
  programs.fish = {
    enable = false;
  };

  programs.alacritty = {
    enable = true;
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

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    settings = {
      format = "$shell$sudo$username$directory$hostname$git_branch$git_commit$git_state$git_status$kubernetes$custom$line_break$jobs$character";
      character = {
        success_symbol = "[ 󰁕](bold blue)";
        error_symbol = "[ 󰁕](bold red)";
        vicmd_symbol = "[ 󰁕](bold white)";
        vimcmd_replace_one_symbol = "[ 󰁕](bold yellow)";
        vimcmd_replace_symbol = "[ 󰁕](bold yellow)";
        vimcmd_visual_symbol = "[ 󰁕](bold orange)";
      };
      directory = {
        style = "bold blue";
        read_only = " ";
      };
      hostname = {
        disabled = true;
        ssh_only = false;
        format = "[@ ](bold)[$hostname](bold blue) ";
      };
      kubernetes = {
        disabled = false;
        format = "[$symbol$context( \($namespace\))]($style) ";
      };
      git_branch = {
        format = "[$symbol$branch]($style) ";
      };

      shell = {
        disabled = false;
        format = "[$indicator]($style)";
        fish_indicator = "";
        bash_indicator = "\\[bash\\] ";
        zsh_indicator = "\\[zsh\\] ";
      };
    };
  };
}
