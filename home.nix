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
    jq.enable = true;
    lazydocker.enable = true;
    codex.enable = true;
    bat.enable = true;
    foot = {
      enable = true;
      server.enable = true;
    };

    fish = import ./fish.nix {};
    tmux = import ./tmux.nix {inherit pkgs;};

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
        gpg = {
          format = "ssh";
        };
        user = {
          email = vars.gitUserEmail;
          name = vars.gitUserName;
          signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKEX4YOOt2sClE5+4Rio++bhyeKywJoAlbLXlgrOfUFl davidaagra@gmail.com";
        };
        commit = {
          gpgsign = true;
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
    settings = import ./hyprland.nix {inherit vars;};
  };

  services = {
    ssh-agent = {
      enable = true;
      enableFishIntegration = true;
    };
    dunst.enable = true;
  };
}
