{ config, lib, ... }@inputs:
{
  imports = [
    ./style.nix
  ];
  options.programs.xob = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    settings = lib.mkOption {
      type = lib.types.str;
      default = "";
    };
  };

  config =
    let
      cfg = config.programs.xob;
    in
    lib.mkIf cfg.enable {
      xdg.configFile."xob/styles.cfg".text = cfg.settings;
    };
}
