{ pkgs, stablePkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    k9s
    terraform
    kubectl
    kubeswitch
    delta

    go
    python3
    nodejs_20

    stablePkgs.azure-cli
    kubelogin

    sops

    inputs.zellij-store.packages.${system}.default
  ];
}
