{ pkgs, lib, ... }@inputs:
{
  home.packages = with pkgs; [
    ueberzug
  ];

  programs.ranger = {
    enable = true;

    aliases = import ./aliases.nix inputs;
    mappings = import ./mappings.nix inputs;
    settings = import ./settings.nix inputs;

    rifle = lib.mapAttrsToList (condition: cmd: {
      condition = condition;
      command = cmd;
    }) (import ./rifle.nix inputs);

    plugins = lib.mapAttrsToList (name: src: {
      name = name;
      src = src;
    }) (import ./plugins.nix inputs);

    extraConfig = ''
      default_linemode devicons
    '';
  };
}
