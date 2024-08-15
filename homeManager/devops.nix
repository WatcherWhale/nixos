{ pkgs, ... }:
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


  ];
}
