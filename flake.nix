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
    homeStateVersion = "25.11";
    system = "aarch64-linux";
    hostname = "nixos";
    machine = "qemu-vm";
    username =
      if nixpkgs.lib.inPureEvalMode
      then "davidagra"
      else builtins.getEnv "USER";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      inherit (pkgs.stdenv) system;

      specialArgs = {
        inherit inputs username homeStateVersion;
        configDir = self;
      };

      modules = [
        home-manager.nixosModules.default
        stylix.nixosModules.stylix

        ./os/${
          if pkgs.stdenv.isLinux
          then "linux.nix"
          else "macos.nix"
        }
        ./machines/${machine}.nix
      ];
    };
  };
}
