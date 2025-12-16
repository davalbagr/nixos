{
  description = "My config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mango = {
      url = "github:DreamMaoMao/mangowc";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      mango,
      ...
    }:
    let
      cfg = builtins.fromTOML (builtins.readFile "${self}/config.toml");
      inherit (cfg)
        hostname
        machine
        system
        username
        ;
      pkgs = nixpkgs.legacyPackages.${system};
      patches = map (name: import "${self}/patches/${name}.nix") (
        if pkgs.lib.attrsets.hasAttrByPath [ "patches" ] cfg then cfg.patches else [ ]
      );
    in
    {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        inherit (pkgs.stdenv) system;

        specialArgs = {
          inherit inputs username;
          configDir = self;
        };

        modules = [
          home-manager.nixosModules.default
          mango.nixosModules.mango

          ./os/linux
          ./machines/${machine}.nix
        ]
        ++ patches;
      };
    };
}
