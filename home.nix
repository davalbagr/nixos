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
      dunst
      hyprshot
      vesktop
      wl-clipboard
      btop
      ulauncher
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
    codex.enable = true;
    foot = {
      enable = true;
      server.enable = true;
    };

    fish = import ./fish.nix {};
    tmux = import ./tmux.nix {};

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

  xdg.desktopEntries = let
    browser = pkgs.lib.getExe pkgs.ungoogled-chromium;
  in {
    slack = {
      type = "Application";
      terminal = false;
      name = "Slack";
      exec = ''${browser} --app="https://slack.com" --new-window'';
    };
  };
}
