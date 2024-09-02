{ pkgs, config, lib, ... }:
let
  cfg = config.lockscreen;
in
{
  options.lockscreen = {
    wallpaper = lib.mkOption {
      type = lib.types.str;
      default = "${config.home.homeDirectory}/Pictures/Wallpaper.png";
    };
    effect = lib.mkOption {
      type = lib.types.str;
      default = "dim";
    };
  };

  config = {
    services.betterlockscreen = {
      enable = true;
      arguments = [
        "${cfg.effect}"
      ];

      inactiveInterval = 10;
    };

    systemd.user.services.betterlockscreen-update = {
      Unit = {
        Description = "Update the wallpaper of the lockscreen";
        After = [ "graphical-session-pre.target" ];
        PartOf = [ "graphical-session.target" ];
      };
      Service = {
        ExecStart = "${pkgs.betterlockscreen}/bin/betterlockscreen -u \"${cfg.wallpaper}\"";
      };
      Install = { WantedBy = [ "graphical-session.target" ]; };
    };
  };
}
