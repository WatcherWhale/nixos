{
  self,
  pkgs,
  stablePkgs,
  ...
}:
{
  imports = [
    "${self}/modules/programs/azure-cli.nix"
    ./kubernetes.nix
  ];

  home.packages = with pkgs; [
    crane
    oras
    cosign

    sops

    trivy

    delta
    gibo

    go
    golangci-lint
    stablePkgs.go-task

    mqtt-explorer
    dbeaver-bin
    mongodb-compass

    yq-go
  ];

  programs.fish.completions = {
    docker = pkgs.docker;
  };
}
