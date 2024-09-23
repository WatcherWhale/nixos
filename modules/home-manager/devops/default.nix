{
  self,
  pkgs,
  stablePkgs,
  inputs,
  ...
}:
{
  imports = [
    "${self}/modules/programs/azure-cli.nix"
    ./kubernetes.nix
  ];

  home.packages = with pkgs; [
    terraform

    crane
    oras
    cosign

    sops

    trivy

    delta
    gibo

    go
    golangci-lint
    go-task

    python3
    python3Packages.pip
    nodejs_20

    inputs.gogl-ci.packages.${system}.default

    rustc
    cargo

    mqtt-explorer
    dbeaver-bin
    mongodb-compass

    nil

    yq-go

    maven
    openjdk17
  ];

  programs.fish.completions.docker = pkgs.docker;
}
