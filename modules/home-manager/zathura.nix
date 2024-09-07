{ ... }:
{
  programs.zathura = {
    enable = true;

    mappings = {
      "+" = "zoom in";
      "-" = "zoom out";
      "=" = "zoom default";

      "<C-+>" = "zoom in";
      "<C-->" = "zoom out";
      "<C-=>" = "zoom default";
    };

    options = {
      selection-clipboard = "clipboard";
      font = "Hack normal 14";
      inputbar-bg = "#3b4252";
      inputbar-fg = "#eceff4";

      statusbar-bg = "#3b4252";
      statusbar-fg = "#eceff4";

      notification-warning-bg = "#ebcb8b";
      notification-warning-fg = "#eceff4";

      notification-error-bg = "#bf616a";
      notification-error-fg = "#eceff4";

      default-bg = "#2e3440";
      default-fg = "#eceff4";
    };
  };
}
