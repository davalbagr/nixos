{
  pkgs,
  vars,
  ...
}: {
  home = {
    stateVersion = vars.homeStateVersion;
    username = vars.username;

    packages = with pkgs; [
      heroku
      nix-your-shell
      nixfmt-rfc-style
      dunst
      hyprshot
      vesktop
      wl-clipboard
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
    ghostty.enable = true;

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

    chromium = {
      enable = true;
      package = pkgs.chromium;
      commandLineArgs = [
        "--disable-features=AutofillSavePaymentMethods"
      ];
      extensions = [
        {id = "nngceckbapebfimnlniiiahkandclblb";}
        {id = "ddkjiahejlhfcafbddmgiahcphecmpfh";}
      ];
    };

    lazygit.enableFishIntegration = true;
    zoxide.enableFishIntegration = true;
    starship.enableFishIntegration = true;
    ghostty.enableFishIntegration = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    settings = import ./hyprland.nix {};
  };

  services.ssh-agent.enable = true;
  services.dunst.enable = true;

  systemd.user.services.wl-clip-persist = {
    Unit = {
      Description = "Persistent clipboard for Wayland";
      PartOf = ["graphical-session.target"];
    };
    Install.WantedBy = ["graphical-session.target"];
    Service.ExecStart = "${pkgs.lib.getExe pkgs.wl-clip-persist} --clipboard both";
  };

  xdg.desktopEntries = {
    slack = {
      terminal = false;
      name = "Slack";
      exec = "${pkgs.lib.getExe pkgs.chromium} --app=\"https://slack.com\"";
    };
  };
}
