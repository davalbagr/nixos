{
  config,
  pkgs,
  inputs,
  vars,
  ...
}: {
  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
      persistent = true;
    };

    settings.auto-optimise-store = true;
  };

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    timeout = 0;
  };

  networking.hostName = vars.hostname;
  networking.wireless.enable = true;

  # networking.networkmanager.enable = true;

  time.timeZone = "Europe/Lisbon";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_PT.UTF-8";
    LC_IDENTIFICATION = "pt_PT.UTF-8";
    LC_MEASUREMENT = "pt_PT.UTF-8";
    LC_MONETARY = "pt_PT.UTF-8";
    LC_NAME = "pt_PT.UTF-8";
    LC_NUMERIC = "pt_PT.UTF-8";
    LC_PAPER = "pt_PT.UTF-8";
    LC_TELEPHONE = "pt_PT.UTF-8";
    LC_TIME = "pt_PT.UTF-8";
  };

  users.users.${vars.username} = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    nh
    nerd-fonts.jetbrains-mono
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  programs = {
    bash = {
      enable = true;
      interactiveShellInit = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '';
    };

    hyprland = {
      enable = true;
      withUWSM = true;
    };

    nvf = {
      enable = true;
      settings = import ../../nvf.nix {};
    };
  };

  stylix = {
    enable = true;
    autoEnable = true;
    cursor = {
      package = pkgs.rose-pine-cursor;
      name = "rose-pine-cursor";
      size = 14;
    };
    fonts = {
      serif = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "nerd-fonts-jetbrains-mono";
      };

      sansSerif = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "nerd-fonts-jetbrains-mono";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "nerd-fonts-jetbrains-mono";
      };
    };
    base16Scheme = {
      slug = "rose-pine";
      base00 = "#191724";
      base01 = "#1f1d2e";
      base02 = "#26233a";
      base03 = "#6e6a86";
      base04 = "#908caa";
      base05 = "#e0def4";
      base06 = "#e0def4";
      base07 = "#524f67";
      base08 = "#eb6f92";
      base09 = "#f6c177";
      base0A = "#ebbcba";
      base0B = "#31748f";
      base0C = "#9ccfd8";
      base0D = "#c4a7e7";
      base0E = "#f6c177";
      base0F = "#524f67";
    };
    image = ../../wallpaper.png;
    targets.nvf.enable = false;
  };

  services = {
    openssh.enable = true;
    getty.autologinUser = vars.username;
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      desktopManager.session = [
        {
          name = "hyprland";
          start = ''
            ${pkgs.hyprland}/bin/Hyprland
          '';
        }
      ];
      displayManager.lightdm.enable = false;
    };
  };

  home-manager = {
    users.${vars.username} = import ../../home.nix {
      inherit
        config
        pkgs
        inputs
        vars
        ;
    };
    sharedModules = [
      {
        stylix.targets.hyprland.enable = true;
      }
    ];
    extraSpecialArgs = {inherit inputs vars;};
  };

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  environment = {
    loginShellInit = ''
      if uwsm check may-start; then
          exec uwsm start hyprland-uwsm.desktop
      fi
    '';

    sessionVariables.NIXOS_OZONE_WL = "1";
  };

  system.stateVersion = vars.homeStateVersion;
}
