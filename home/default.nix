{
  pkgs,
  vars,
  ...
}: {
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

  programs = pkgs.lib.attrsets.concatMapAttrs (name: value: {
    ${pkgs.lib.strings.removeSuffix ".nix" name} = import ./programs/${name} {
      inherit pkgs;
      inherit vars;
    };
  }) (builtins.readDir ./programs);

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    settings = import ../hyprland.nix {inherit vars;};
  };

  services = {
    ssh-agent = {
      enable = true;
      enableFishIntegration = true;
    };
    dunst.enable = true;
  };
}
