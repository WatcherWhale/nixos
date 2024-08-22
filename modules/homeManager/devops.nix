{ pkgs, stablePkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    k9s
    kubectl
    kubeswitch
    kubernetes-helm

    terraform

    crane
    oras

    delta

    go
    golangci-lint
    go-task

    python3
    nodejs_20

    stablePkgs.azure-cli
    kubelogin

    inputs.zellij-store.packages.${system}.default

    rustc
    cargo
  ];
}
