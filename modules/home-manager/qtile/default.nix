{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.custom.programs.qtile;
in
{
  options = {
    custom.programs.qtile = {
      enable = lib.mkEnableOption "qtile";

      installDir = lib.mkOption {
        description = ''The installation directory.'';
        type = lib.types.str;
        default = "qtile";
      };

      autostart = lib.mkOption {
        description = ''The autostart file for the user.'';
        type = lib.types.package;
        default = pkgs.writeShellScriptBin "autostart" '''';
      };

      autostart_always = lib.mkOption {
        description = ''The autostart_always file for the user.'';
        type = lib.types.package;
        default = pkgs.writeShellScriptBin "autostart_always" '''';
      };
    };
  };

  config = lib.mkIf cfg.enable {
    xdg.configFile."${cfg.installDir}/screens".source = ./config/screens;
    xdg.configFile."${cfg.installDir}/settings".source = ./config/settings;
    xdg.configFile."${cfg.installDir}/themes".source = ./config/themes;
    xdg.configFile."${cfg.installDir}/config.py".source = ./config/config.py;
    xdg.configFile."${cfg.installDir}/autostart_always".source = "${config.custom.programs.qtile.autostart_always}/bin/autostart_always";
    xdg.configFile."${cfg.installDir}/autostart".source = "${config.custom.programs.qtile.autostart}/bin/autostart";
  };
}
