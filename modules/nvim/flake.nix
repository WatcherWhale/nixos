{
  description = "A flake containing my home-manager neovim setup.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    git-worktree-nvim = {
      flake = false;
      url = "github:WatcherWhale/git-worktree.nvim";
    };
  };

  outputs =
    { self, ... }:
    {
      nixosModules.default = self.nixosModules.nvim;
      nixosModules.nvim.imports = [
        ./nix
      ];
    };
}
