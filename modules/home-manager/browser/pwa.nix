{ pkgs, ... }:
{
  home.file.".local/share/youtube-music.desktop".text = ''
    #!/usr/bin/env xdg-open
    [Desktop Entry]
    Version=1.0
    Terminal=false
    Type=Application
    Name=YouTube Music
    Exec=${pkgs.brave}/opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=cinhimbnkkaeohfgghhklpknlkffjgod
    Icon=brave-cinhimbnkkaeohfgghhklpknlkffjgod-Default
    StartupWMClass=crx_cinhimbnkkaeohfgghhklpknlkffjgod
  '';
}
