{ ... }:
{
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
        format = "[$symbol$context( ($namespace))]($style) ";
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
