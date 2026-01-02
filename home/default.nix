{
  pkgs,
  inputs,
  config,
  username,
  ...
}:
let
  treesitterGrammars = (pkgs.tree-sitter.withPlugins (p:
      let 
        all = pkgs.tree-sitter.builtGrammars;
      in
      builtins.attrValues (builtins.removeAttrs all [ "tree-sitter-razor" ])
  ));
  importDir =
    type:
    pkgs.lib.attrsets.concatMapAttrs (name: value: {
      ${pkgs.lib.strings.removeSuffix ".nix" name} = import ./${type}/${name} {
        inherit
          inputs
          config
          username
          pkgs
          treesitterGrammars
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
        kakoune-lsp
        kak-tree-sitter
        treesitterGrammars
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
