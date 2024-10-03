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
      default = false;
    };
  };

  config = {
    home.packages = [
      (pkgs.writeShellScriptBin "lock" ''
        ${pkgs.betterlockscreen}/bin/betterlockscreen -l ${cfg.effect}
      '')
    ];

    services.screen-locker.xautolock.enable = false;

    services.betterlockscreen = {
      enable = true;
      arguments = [ "${cfg.effect}" ];

      inactiveInterval = 10;
    };

    programs.autorandr.hooks.postswitch."betterlockscreen-update" = lib.mkIf cfg.autorandr.hook ''${pkgs.betterlockscreen}/bin/betterlockscreen -u "${cfg.wallpaper}" &'';
  };
}
