{ lib, config, ... }:
let
  completions = config.programs.fish.extraCompletions;
in
{
  options = {
    programs.fish.extraCompletions = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = { };
    };
  };

  config.xdg.configFile = lib.genAttrs (lib.attrNames completions) (
    key:
    let
      src = completions.${key};
    in
    {
      source = src;
      target = "fish/completions/${key}.fish";
    }
  );
}
