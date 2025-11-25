{
  description = "My config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf/v0.8";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    stylix,
    nvf,
    ...
  }: let
    vars = import ./variables.nix;
  in {
    nixosConfigurations.${vars.hostname} = nixpkgs.lib.nixosSystem {
      system = vars.system;

      specialArgs = {
        inherit inputs vars;
        configDir = self;
      };

      modules = [
        home-manager.nixosModules.default
        stylix.nixosModules.stylix

        ./hosts/${vars.hostname}/default.nix
        ./hosts/${vars.hostname}/hardware-configuration.nix
      ];
    };
  };
}
