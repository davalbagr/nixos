{
  pkgs,
  inputs,
  username,
  ...
}: let
  importDir = type:
    pkgs.lib.attrsets.concatMapAttrs (name: value: {
      ${pkgs.lib.strings.removeSuffix ".nix" name} = import ./${type}/${name} {
        inherit pkgs;
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
      gtk.enable = true;
    };

    packages = with pkgs; [
      heroku
      postman
      nix-your-shell
      libnotify
      hyprshot
      vesktop
      wl-clipboard
      ulauncher
      (
        if pkgs.stdenv.system == "aarch64-linux"
        then slacky
        else slack
      )
    ];
  };

  gtk.enable = true;

  programs = importDir "programs";
  services = importDir "services";

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    settings = import ../hyprland.nix {inherit pkgs;};
  };
}
