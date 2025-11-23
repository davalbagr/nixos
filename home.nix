{
  config,
  pkgs,
  inputs,
  vars,
  ...
}: {
  home = {
    stateVersion = vars.homeStateVersion;
    username = vars.username;

    packages = with pkgs; [
      ghostty
      brave
      heroku
      nix-your-shell
      nixfmt-rfc-style
      vesktop
      hyprshot
    ];
  };

  programs = {
    home-manager.enable = true;
    git.enable = true;
    starship.enable = true;
    lazygit.enable = true;
    ssh.enable = true;
    zoxide.enable = true;
    ripgrep.enable = true;
    yazi.enable = true;
    eza.enable = true;
    fd.enable = true;
    lazydocker.enable = true;
    fish = import ./fish.nix {};
    rofi = import ./rofi.nix {};

    ssh.extraConfig = ''
      AddKeysToAgent yes
    '';

    git = {
      settings = {
        user = {
          email = vars.gitUserEmail;
          name = vars.gitUserName;
        };
        init.defaultBranch = "main";
        pull.rebase = true;
      };
    };

    lazygit.enableFishIntegration = true;
    zoxide.enableFishIntegration = true;
    starship.enableFishIntegration = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    settings = import ./hyprland.nix {};
  };

  xdg.configFile."ghostty/config".text = ''
    theme = Rose Pine
    window-decoration = none
  '';

  services.ssh-agent.enable = true;
}
