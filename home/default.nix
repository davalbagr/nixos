{
  pkgs,
  inputs,
  config,
  username,
  ...
}:
let
  importDir =
    type:
    pkgs.lib.attrsets.concatMapAttrs (name: value: {
      ${pkgs.lib.strings.removeSuffix ".nix" name} = import ./${type}/${name} {
        inherit
          inputs
          config
          username
          pkgs
          ;
      };
    }) (builtins.readDir ./${type});
in
{
  imports = [
    inputs.mango.hmModules.mango
  ];

  home = {
    inherit username;

    stateVersion = "25.11";
    packages =
      with pkgs;
      [
        heroku
        postman
        ffmpeg
        resvg
        poppler
        scooter
        devcontainer
        tree-sitter

        kakoune-lsp
        kak-tree-sitter
      ]
      ++ (if pkgs.stdenv.system == "aarch64-linux" then [ slacky ] else [ slack ]);
  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "JetBrainsMonoNerdFont" ];
      sansSerif = [ "JetBrainsMonoNerdFont" ];
      serif = [ "JetBrainsMonoNerdFont" ];
    };
  };

  gtk = {
    enable = pkgs.stdenv.isLinux;
  };

  programs = importDir "programs";
  services = importDir "services";

  wayland.windowManager.mango = import ../os/linux/mango.nix { inherit pkgs inputs; };

  xdg.desktopEntries.discord = {
    name = "Discord";
    exec = ''chromium --new-window --app="https://discord.com/channels/@me"'';
    terminal = false;
    type = "Application";
  };
}
