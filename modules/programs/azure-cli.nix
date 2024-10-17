{
  pkgs,
  lib,
  stablePkgs,
  ...
}:
let
  mkAzExtension =
    {
      pname,
      version,
      url,
      sha256,
      description,
      ...
    }@args:
    pkgs.python3.pkgs.buildPythonPackage (
      {
        format = "wheel";
        src = pkgs.fetchurl { inherit url sha256; };
        meta = {
          inherit description;
          inherit (pkgs.azure-cli.meta) platforms maintainers;
          homepage = "https://github.com/Azure/azure-cli-extensions";
          changelog = "https://github.com/Azure/azure-cli-extensions/blob/main/src/${pname}/HISTORY.rst";
          license = lib.licenses.mit;
          sourceProvenance = [ lib.sourceTypes.fromSource ];
        } // args.meta or { };
      }
      // (removeAttrs args [
        "url"
        "sha256"
        "description"
        "meta"
      ])
    );

  azure-iot = mkAzExtension rec {
    pname = "azure-iot";
    version = "0.24.0";
    url = "https://github.com/Azure/azure-iot-cli-extension/releases/download/v${version}/azure_iot-${version}-py3-none-any.whl";
    sha256 = "sha256-o25B8okE8vKe/Tjr69poI8CpEBvtPADgrwPP/81yHaE=";
    description = "Azure IoT Extension";
    propagatedBuildInputs = with pkgs.python3Packages; [
      isodate
      tqdm
    ];
  };

  extensions = with pkgs.azure-cli.extensions; [
    azure-iot
    fzf
  ];
in
{
  home.packages = with stablePkgs; [ (azure-cli.withExtensions extensions) ];
}
