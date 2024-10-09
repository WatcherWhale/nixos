{
  self,
  pkgs,
  inputs,
  lib,
  ...
}:
let
  user = "watcherwhale";
  homePath = "/home/${user}";
in
{
  imports = [
    "${self}/modules/home-manager/nvim"
    "${self}/modules/home-manager/shell"
  ];

  programs.alacritty.enable = lib.mkForce false;

  programs.fish = {
    shellAliases = {
      al = "aloxy";
    };

    functions = {
      aloxy = # fish
        ''
          set ALDIR ""
          if count $argv > /dev/null
              set ALDIR "$(find ~/Projects/Aloxy/* -maxdepth 1 -type d | fzf -q "$argv[1]")"
              if test -n "$ALDIR"
              else
                  return
              end
          else
              set ALDIR "$(find ~/Projects/Aloxy/* -maxdepth 1 -type d | fzf)"
              if test -n "$ALDIR"
              else
                  return
              end
          end

          cd "$ALDIR"
          zellij action rename-tab "$(echo "$ALDIR" | rev | awk -F"/" '{ print $1 }' | rev)" &
          direnv exec . nvim
        '';
    };
  };

  home.username = user;
  home.homeDirectory = homePath;
  #programs.git.userEmail = "watcherwhale@maes.family";

  home.packages = with pkgs; [ home-manager ];

  home.stateVersion = "24.05";
}
