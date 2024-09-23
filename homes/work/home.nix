{
  self,
  pkgs,
  inputs,
  ...
}:
let
  user = "work";
  homePath = "/home/${user}";
  zellij-store = inputs.zellij-store.packages.x86_64-linux.default;
in
{
  imports = [
    "${self}/modules/home-manager"
    "${self}/modules/programs/intellij.nix"
    "${self}/modules/programs/ftb-app"
  ];

  home.username = user;
  home.homeDirectory = homePath;

  custom.programs.qtile.autostart = pkgs.writeShellScriptBin "autostart" ''
    ${zellij-store}/bin/zellij-store clean &
    sh -c 'find ${homePath}/Downloads/* -mtime +50 -type f -exec rm {} \;' &
    sh -c 'find ~/.config/mpv/watch_later -mtime +30 -print | xargs rm -f' &
    nm-applet &
    #/usr/lib/kdeconnectd &
    #kdeconnect-indicator &
    #trash-empty 30 &

    sleep 2

    blueman-applet &
    ${pkgs.zellij}/zellij delete-all-sessions -y &

    # YT-Music
    gio launch "$HOME/.nix-profile/share/applications/youtube-music.desktop" &

    # Teams
    gio launch "$HOME/.nix-profile/share/applications/teams.desktop" &

    thunderbird &
  '';

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

  home.stateVersion = "24.05";
}
