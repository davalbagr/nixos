{
  description = "My config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    nvf.url = "github:notashelf/nvf/v0.8";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nvf,
    ...
  }: let
    vars = import ./variables.nix;

    pkgs = import nixpkgs {
      system = vars.system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations.${vars.hostname} = nixpkgs.lib.nixosSystem {
      system = vars.system;

      specialArgs = {
        inherit inputs vars;
        configDir = self;
      };

      modules = [
        home-manager.nixosModules.default
        nvf.nixosModules.default

        ./hosts/${vars.hostname}/default.nix
        ./hosts/${vars.hostname}/hardware-configuration.nix
      ];
    };
  };
}
