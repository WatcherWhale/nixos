{ pkgs, ... }:
{
  home.packages = with pkgs; [
    k9s
    terraform
    kubectl
    delta

    python3
    nodejs_20
  ];
}
