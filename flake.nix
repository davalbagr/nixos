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
    ...
  }: let
    cfg = builtins.fromTOML (builtins.readFile "${self}/config.toml");
  in {
    nixosConfigurations.${cfg.hostname} = nixpkgs.lib.nixosSystem {
      system = cfg.system;

      specialArgs = {
        inherit inputs cfg;
        configDir = self;
      };

      modules = [
        home-manager.nixosModules.default
        stylix.nixosModules.stylix

        ./hosts/${cfg.hostname}/default.nix
        ./hosts/${cfg.hostname}/hardware-configuration.nix
      ];
    };
  };
}
