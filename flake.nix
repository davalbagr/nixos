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
    inherit (cfg) hostname machine system username;
    pkgs = nixpkgs.legacyPackages.${system};
    patches = map (name: import "${self}/patches/${name}.nix") cfg.patches;
  in {
    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      inherit (pkgs.stdenv) system;

      specialArgs = {
        inherit inputs username;
        configDir = self;
      };

      modules =
        [
          home-manager.nixosModules.default
          stylix.nixosModules.stylix

          ./os/linux
          ./machines/${machine}.nix
        ]
        ++ patches;
    };
  };
}
