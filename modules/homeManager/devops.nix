{ pkgs, stablePkgs, inputs, ... }:
{
  imports = [
    ../programs/azure-cli.nix
  ];
  home.packages = with pkgs; [
    k9s
    kubectl
    kubeswitch
    kubernetes-helm

    terraform

    crane
    oras
    cosign

    sops

    trivy

    delta

    go
    golangci-lint
    go-task

    python3
    python3Packages.pip
    nodejs_20

    kubelogin

    inputs.zellij-store.packages.${system}.default

    rustc
    cargo

    mqtt-explorer
  ];
}
