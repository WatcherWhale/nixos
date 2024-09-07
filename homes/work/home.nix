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

  home.stateVersion = "24.05";
}
