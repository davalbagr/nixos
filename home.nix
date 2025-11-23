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
      nix-your-shell
      nixfmt-rfc-style
      dunst
      hyprshot
      vesktop
      wl-clipboard
      btop
    ];
  };

  gtk = {
    enable = true;
  };

  programs = {
    home-manager.enable = true;
    git.enable = true;
    starship.enable = true;
    lazygit.enable = true;
    zoxide.enable = true;
    ripgrep.enable = true;
    yazi.enable = true;
    eza.enable = true;
    fd.enable = true;
    lazydocker.enable = true;
    foot = {
      enable = true;
      server.enable = true;
    };

    fish = import ./fish.nix {};
    rofi = import ./rofi.nix {};

    ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks."*" = {
        forwardAgent = false;
        addKeysToAgent = "yes";
        compression = false;
        serverAliveInterval = 0;
        serverAliveCountMax = 3;
        hashKnownHosts = false;
        userKnownHostsFile = "~/.ssh/known_hosts";
        controlMaster = "no";
        controlPath = "~/.ssh/master-%r@%n:%p";
        controlPersist = "no";
      };
    };

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
      package = pkgs.ungoogled-chromium;
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
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    settings = import ./hyprland.nix {};
  };

  services.ssh-agent.enable = true;
  services.dunst.enable = true;

  xdg.desktopEntries = {
    slack = {
      terminal = false;
      name = "Slack";
      exec = "${pkgs.lib.getExe pkgs.chromium} --app=\"https://slack.com\"";
    };
  };
}
