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
  ];

  home = {
    inherit username;

    stateVersion = "25.11";
    pointerCursor = {
      gtk.enable = pkgs.stdenv.isLinux;
    };

    packages = with pkgs;
      [
        heroku
        postman
        nix-your-shell
        libnotify
        hyprshot
        wl-clipboard
      ]
      ++ (
        if pkgs.stdenv.system == "aarch64-linux"
        then [slacky]
        else [slack discord]
      );
  };

  gtk.enable = pkgs.stdenv.isLinux;

  programs = importDir "programs";
  services = importDir "services";

  wayland.windowManager.hyprland = {
    enable = pkgs.stdenv.isLinux;
    systemd.enable = false;
    settings = import ../os/linux/hyprland.nix {inherit pkgs;};
  };
}
