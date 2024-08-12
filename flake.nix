{
  description = "personal nixos configs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, disko, ... } @inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {

    nixosConfigurations = {
      whaleshark = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          # disko.nixosModules.disko
          # ./hosts/whaleshark/disko.nix

          ./system/default.nix
          ./hosts/whaleshark/configuration.nix

          ./homes/watcherwhale/user.nix
          ./homes/work/user.nix
        ];
      };
    };

    homeConfigurations = {
      watcherwhale = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [];
      };
    };
  };
}
