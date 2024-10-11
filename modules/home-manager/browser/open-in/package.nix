{ pkgs, ... }:
let
  nodeSource = pkgs.stdenv.mkDerivation {
    name = "open-in";
    version = "1.0.0";
    src = ./src;

    installPhase = ''
      mkdir -p $out
      cp * $out/
    '';
  };
in
pkgs.writeShellScriptBin "run-open-in" ''
  ${pkgs.nodejs}/bin/node ${nodeSource}/host.js
''
