{ pkgs, ... }:
{
  services.dunst = {
    enable = true;

    iconTheme = {
      name = "Flat-Remix-Blue-Dark";
      package = pkgs.flat-remix-icon-theme;
    };

    settings = {
      global = {
        geometry = "480x60-8+53";
        follow = "mouse";
        origin = "top-right";

        frame_width = 4;
        padding = 20;
        horizontal_padding = 20;
        separator_height = 4;
        separator_color = "auto";
        shrink = true;
        line_height = 4;

        font = "NotoSans Nerd Font 14";

        indicate_hidden = true;
        sort = false;
        idle_threshold = 120;
        markup = "full";
        format = "<b>%s</b> (%a)\\n%b";
        alignment = "left";
        show_age_threshold = 60;
        word_wrap = true;
        ignore_newline = false;
        stack_duplicates = false;
        hide_duplicate_count = true;
        show_indicators = true;
        icon_position = "left";
        max_icon_size = 96;
        sticky_history = true;
        history_length = 20;
        browser = "x-www-browser -new-tab";
        always_run_script = true;
        title = "Dunst";
        class = "Dunst";
        show_icons = "left";
      };

      urgency_low = {
        timeout = 5;
        background = "#4c566a";
        foreground = "#eceff4";
        frame_color = "#81a1c1";
      };

      urgency_normal = {
        timeout = 10;
        background = "#4c566a";
        foreground = "#eceff4";
        frame_color = "#81a1c1";
      };

      urgency_critical = {
        timeout = 20;
        background = "#4c566a";
        foreground = "#eceff4";
        frame_color = "#ebcb8b";
      };

    };
  };
}
