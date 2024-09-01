{
  self,
  lib,
  ...
}:
let
  hostname = lib.removeSuffix "\n" (builtins.readFile /proc/sys/kernel/hostname);
in
{
  imports = [
    "${self}/hosts/${hostname}/autorandr.nix"
  ];

  programs.autorandr = {
    enable = true;

    hooks = {
      postswitch = {
        "qtile-restart" = "qtile cmd-obj -o cmd -f restart";
      };
    };

  };
}
