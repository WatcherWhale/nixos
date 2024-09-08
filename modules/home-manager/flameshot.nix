{ ... }:
{
  services.flameshot = {
    enable = true;

    settings = {
      General = {
        contrastOpacity = 188;
        disabledTrayIcon = true;
        drawColor = "#5a353e";
        drawThickness = 8;
        showDesktopNotification = false;
        showHelp = false;
        showStartupLaunchMessage = false;
        uiColor = "#00a3ff";
      };
    };
  };
}
