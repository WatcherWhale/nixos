{
  description = "personal nixos configs";

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      disko,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      stablePkgs = inputs.nixpkgsstable.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        whaleshark = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit self;
            inherit inputs;
            inherit stablePkgs;
          };
          modules = [
            disko.nixosModules.disko

            # System config
            ./hosts/whaleshark

            # Create users
            ./homes/watcherwhale/user.nix
            ./homes/work/user.nix
          ];
        };
      };

      homeConfigurations = {
        watcherwhale = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit self;
            inherit inputs;
            inherit stablePkgs;
          };
          modules = [
            ./homes/watcherwhale/home.nix
          ];
        };
        work = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit self;
            inherit inputs;
            inherit stablePkgs;
          };
          modules = [
            ./homes/work/home.nix
          ];
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgsstable.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zellij-store = {
      url = "github:WatcherWhale/Zellij-Store";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    gogl-ci = {
      url = "github:WatcherWhale/gogl-ci";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:MarceColl/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

}
