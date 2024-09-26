{
  self,
  pkgs,
  inputs,
  ...
}:
let
  user = "watcherwhale";
  homePath = "/home/${user}";
  zellij-store = inputs.zellij-store.packages.x86_64-linux.default;
in
{
  imports = [
    "${self}/modules/home-manager"

    "${self}/modules/programs/dungeondraft"
    "${self}/modules/programs/wonderdraft"
    "${self}/modules/programs/ftb-app"
  ];

  home.username = user;
  home.homeDirectory = homePath;
  programs.git.useremail = "watcherwhale@maes.family";

  custom.programs.qtile.autostart = pkgs.writeShellScriptBin "autostart" ''
    ${zellij-store}/bin/zellij-store clean &
    sh -c 'find /home/watcherwhale/Downloads/* -mtime +50 -type f -exec rm {} \;' &
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

    steam -silent $USER &

    sleep 6
    systemctl --user start sunshine &
  '';

  home.packages = with pkgs; [ ];

  home.stateVersion = "24.05";
}
