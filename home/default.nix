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
    inputs.zen-browser.homeModules.twilight
    inputs.nvf.homeManagerModules.nvf
  ];

  home = {
    inherit username;

    stateVersion = "26.05";
    packages = with pkgs; [
      heroku
      postman
      ffmpeg
      resvg
      poppler
      devcontainer
      watchman
    ];
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
}
