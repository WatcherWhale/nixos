{
  description = "personal nixos configs";

  outputs =
    {
      self,
      nixpkgs,
      nixos-hardware,
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

        bluewhale = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit self;
            inherit inputs;
            inherit stablePkgs;
          };
          modules = [
            disko.nixosModules.disko

            # System config
            ./hosts/bluewhale

            # Create users
            ./homes/watcherwhale/user.nix
            ./homes/work/user.nix
          ];
        };

        hammerhead = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit self;
            inherit inputs;
            inherit stablePkgs;
          };
          modules = [
            nixos-hardware.nixosModules.dell-xps-15-9570-nvidia
            disko.nixosModules.disko

            # System config
            ./hosts/hammerhead

            # Create users
            ./homes/watcherwhale/user.nix
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
          modules = [ ./homes/watcherwhale/home.nix ];
        };
        watcherwhaleArch = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit self;
            inherit inputs;
            inherit stablePkgs;
          };
          modules = [ ./homes/watcherwhale/arch.nix ];
        };
        work = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit self;
            inherit inputs;
            inherit stablePkgs;
          };
          modules = [ ./homes/work/home.nix ];
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgsstable.url = "github:nixos/nixpkgs/nixos-24.05";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

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
