{
  pkgs,
  inputs,
  config,
  username,
  ...
}: let
  importDir = type:
    pkgs.lib.attrsets.concatMapAttrs (name: value: {
      ${pkgs.lib.strings.removeSuffix ".nix" name} = import ./${type}/${name} {
        inherit inputs config username pkgs;
      };
    }) (builtins.readDir ./${type});
in {
  imports = [
    inputs.nvf.homeManagerModules.default
    inputs.mango.hmModules.mango
  ];

  home = {
    inherit username;

    stateVersion = "25.11";
    pointerCursor = {
      gtk.enable = pkgs.stdenv.isLinux;
      name = "BreezX-RosePine-Linux";
      package = pkgs.rose-pine-cursor;
      size = 14;
    };

    packages = with pkgs;
      [
        heroku
        postman
        nix-your-shell
        rose-pine-cursor
      ]
      ++ (
        if pkgs.stdenv.system == "aarch64-linux"
        then [slacky]
        else [slack discord]
      );
  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = ["JetBrainsMonoNerdFont"];
      sansSerif = ["JetBrainsMonoNerdFont"];
      serif = ["JetBrainsMonoNerdFont"];
    };
  };

  gtk.enable = pkgs.stdenv.isLinux;

  programs = importDir "programs";
  services = importDir "services";

  wayland.windowManager.mango = import ../os/linux/mango.nix {inherit pkgs inputs;};
}
