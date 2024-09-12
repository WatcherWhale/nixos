{
  lib,
  config,
  ...
}:
let
  completions = config.programs.fish.completions;
in
{
  imports = [ ./extraCompletions.nix ];

  options = {
    programs.fish.completions = lib.mkOption {
      type = lib.types.attrsOf lib.types.package;
      default = { };
    };
  };

  config.xdg.configFile = lib.genAttrs (lib.attrNames completions) (
    key:
    let
      pkg = completions.${key};
    in
    {
      source = "${pkg}/share/fish/vendor_completions.d/${key}.fish";
      target = "fish/completions/${key}.fish";
    }
  );
}
