{
  pkgs,
  config,
  lib,
  ...
}:
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
    autorandr.hook = lib.mkOption {
      type = lib.types.bool;
      default = true;
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

    programs.autorandr.hooks.postswitch."betterlockscreen-update" = lib.mkIf cfg.autorandr.hook "${pkgs.betterlockscreen}/bin/betterlockscreen -u \"${cfg.wallpaper}\"";
  };
}
