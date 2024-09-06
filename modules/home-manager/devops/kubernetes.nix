{ pkgs, ... }:
{
  home.packages = with pkgs; [
    k9s
    kubectl

    kubeswitch

    kustomize
    kubernetes-helm

    fluxcd

    kind

    # Azure AKS login cli
    kubelogin

    kubefwd

    # Extra helper scripts
    (pkgs.writeShellScriptBin "kubectl-fw" ''
      sudo -E ${pkgs.kubefwd}/bin/kubefwd svc -A
    '')
  ];
}
