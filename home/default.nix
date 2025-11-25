{
  pkgs,
  vars,
  inputs,
  ...
}: let
  importDir = type:
    pkgs.lib.attrsets.concatMapAttrs (name: value: {
      ${pkgs.lib.strings.removeSuffix ".nix" name} = import ./${type}/${name} {
        inherit pkgs;
        inherit vars;
      };
    }) (builtins.readDir ./${type});
in {
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  home = {
    stateVersion = vars.homeStateVersion;
    username = vars.username;
    pointerCursor = {
      gtk.enable = true;
    };

    packages = with pkgs; [
      heroku
      postman
      nix-your-shell
      nixfmt-rfc-style
      libnotify
      hyprshot
      vesktop
      wl-clipboard
      ulauncher
      btop
      (
        if vars.system == "aarch64-linux"
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
    settings = import ../hyprland.nix {inherit vars;};
  };
}
