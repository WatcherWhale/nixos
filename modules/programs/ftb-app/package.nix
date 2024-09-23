{ pkgs, ... }:
let
  pname = "ftb-app";
  version = "1.25.18";

  src = pkgs.fetchurl {
    url = "https://piston.feed-the-beast.com/app/${pname}-${version}-x86_64.AppImage";
    hash = "sha256-qqcEovw8SoPzHS3Uz82IxONa/LHr9y9/rt2tIXE/P8g=";
  };
in
pkgs.appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands =
    let
      contents = pkgs.appimageTools.extractType2 { inherit pname version src; };
    in
    # bash
    ''
      mkdir -p "$out/share/applications"
      mkdir -p "$out/share/lib/ftb-app"
      cp "${contents}/${pname}.desktop" "$out/share/applications/"
      cp -r ${contents}/usr/* "$out"
      cp -r ${contents}/{locales,resources} "$out/share/lib/ftb-app"
      substituteInPlace $out/share/applications/${pname}.desktop --replace 'Exec=AppRun' 'Exec=${pname}'
    '';
}
