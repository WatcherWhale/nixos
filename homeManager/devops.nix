{ pkgs, ... }:
{
  home.packages = with pkgs; [
    k9s
    terraform
    kubectl
    delta

    go
    python3
    nodejs_20
  ];
}
