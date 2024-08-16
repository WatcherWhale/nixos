{ pkgs, inputs, ... }:
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

    azure-cli
    kubelogin

    inputs.zellij-store.packages.${system}.default
  ];
}
