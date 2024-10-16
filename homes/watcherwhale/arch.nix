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
    "${self}/modules/home-manager/session.nix"
  ];

  home.packages = with pkgs; [
    nh
    dig
    doggo
  ];

  nix.gc = {
    automatic = true;
    frequency = "hourly";
    options = "--delete-older-than 7d";
  };

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

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
