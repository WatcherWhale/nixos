{ pkgs, ... }:
{
  xdg.desktopEntries."youtube-music" = let id = "cinhimbnkkaeohfgghhklpknlkffjgod"; in {
    exec = "${pkgs.brave}/opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=${id}";
    type = "Application";
    terminal = false;
    name = "YouTube Music";
    icon = "brave-${id}-Default";
  };

  xdg.desktopEntries."teams" = let id = "cifhbcnohmdccbgoicgdjpfamggdegmo"; in {
    exec = "${pkgs.brave}/opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=${id}";
    type = "Application";
    terminal = false;
    name = "Microsoft Teams";
    icon = "brave-${id}-Default";
  };

  xdg.desktopEntries."whatsapp" = let id = "hnpfjngllnobngcgfapefoaidbinmjnm"; in {
    exec = "${pkgs.brave}/opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=${id}";
    type = "Application";
    terminal = false;
    name = "WhatsApp";
    icon = "brave-${id}-Default";
  };
}
