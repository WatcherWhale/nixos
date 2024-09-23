{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.lf;
in
{
  options.lf = {
    enable = lib.mkEnableOption "lf";
  };

  config = lib.mkIf cfg.enable {
    xdg.configFile."lf/icons".source = ./icons;

    programs.lf = {
      enable = true;

      settings = {
        preview = true;
        drawbox = true;
        icons = true;
        ignorecase = true;
        hidden = false;
      };

      commands = {
        dragon-out = ''%${pkgs.xdragon}/bin/xdragon -a -x "$fx"'';
        editor-open = "$$EDITOR $f";
        mkdir = ''
          ''${{
            printf "Directory Name: "
            read DIR
            mkdir $DIR
          }}
        '';
      };

      keybindings = {
        "<f-7>" = "mkdir";
        "<backspace>" = "set hidden!";
        "<backspace2>" = "set hidden!";
      };

      extraConfig =
        let
          previewer = pkgs.writeShellScriptBin "pv.sh" ''
            file=$1
            w=$2
            h=$3
            x=$4
            y=$5

            ${pkgs.pistol}/bin/pistol "$file"
          '';
        in
        ''
          set previewer ${previewer}/bin/pv.sh
        '';
    };
  };
}
