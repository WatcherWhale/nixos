{ pkgs, stablePkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    k9s
    kubectl
    kubeswitch
    kubernetes-helm

    terraform
    tflint

    delta

    go-task

    go
    python3
    nodejs_20

    stablePkgs.azure-cli
    kubelogin

    sops

    inputs.zellij-store.packages.${system}.default

    rustc
    cargo
  ];
}
