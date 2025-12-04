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
      x11.enable = true;
      name = "BreezX-RosePine-Linux";
      package = pkgs.rose-pine-cursor;
      size = 24;
    };

    packages = with pkgs;
      [
        heroku
        postman
        nix-your-shell
        gh
      ]
      ++ (
        if pkgs.stdenv.system == "aarch64-linux"
        then [slacky]
        else [slack]
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

  gtk = {
    enable = pkgs.stdenv.isLinux;
    theme = {
      name = "rose-pine-gtk";
      package = pkgs.rose-pine-gtk-theme;
    };
    iconTheme = {
      name = "rose-pine-icons";
      package = pkgs.rose-pine-icon-theme;
    };
    cursorTheme = {
      name = "BreezX-RosePine-Linux";
      size = 24;
      package = pkgs.rose-pine-cursor;
    };
  };

  programs = importDir "programs";
  services = importDir "services";

  wayland.windowManager.mango = import ../os/linux/mango.nix {inherit pkgs inputs;};

  xdg.desktopEntries.discord = {
    name = "Discord";
    exec = ''librewolf --new-window "https://discord.com/channels/@me"'';
    terminal = false;
    type = "Application";
  };
}
