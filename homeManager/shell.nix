{ ... }:
{
  programs.fish = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    settings = ''
format = """\
  $shell\
  $sudo\
  $username\
  $directory\
  $hostname\
  $git_branch\
  $git_commit\
  $git_state\
  $git_status\
  $kubernetes\
  $cmd_duration\
  $custom\
  $line_break\
  $jobs\
  $character\
  """

[character]
success_symbol = "[ 󰁕](bold blue)"
error_symbol = "[ 󰁕](bold red)"
vicmd_symbol = "[ 󰁕](bold white)"
vimcmd_replace_one_symbol = "[ 󰁕](bold yellow)"
vimcmd_replace_symbol = "[ 󰁕](bold yellow)"
vimcmd_visual_symbol = "[ 󰁕](bold orange)"

[time]
disabled = false
format = "[$time]($style)"
style = "bold cyan"
time_format = "(%H:%M:%S)"

[cmd_duration]
disabled = true
min_time = 60_000

[directory]
style = "bold blue"
read_only = " "

[hostname]
disabled = true
ssh_only = false
format = "[@ ](bold)[$hostname](bold blue) "

[kubernetes]
disabled = false
format = '[$symbol$context( \($namespace\))]($style) '

[git_branch]
format = "[$symbol$branch]($style) "

[shell]
disabled = false
format = "[$indicator]($style)"
fish_indicator = ""
bash_indicator = "\\[bash\\] "
zsh_indicator = "\\[zsh\\] "

[custom.tf]
symbol="󱁢"
format = "[$symbol $output]($style)"
style="bold cyan"
command='jq -r .backend.config.key .terraform/terraform.tfstate | sed -e "s/.tfstate//g"'
detect_folders=[".terraform"]
    '';
  };
}
