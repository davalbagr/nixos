{
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
  ];

  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  programs = {
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep 3";
    };

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
  };

  stylix = import ../../stylix.nix {inherit pkgs;};

  security.rtkit.enable = true;
  services = {
    pipewire.enable = true;
    pipewire.wireplumber.enable = true;
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
    libinput.touchpad.naturalScrolling = true;
    libinput.mouse.naturalScrolling = true;
    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "performance";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        START_CHARGE_THRESH_BAT0 = 40;
        STOP_CHARGE_THRESH_BAT0 = 80;
      };
    };
  };

  home-manager = {
    users.${vars.username} = import ../../home {
      inherit
        pkgs
        vars
        inputs
        ;
    };
    sharedModules = [
      {
        stylix.targets.hyprland.enable = true;
      }
    ];
    extraSpecialArgs = {inherit inputs vars;};
    overwriteBackup = true;
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
      fi > /dev/null
    '';

    sessionVariables.NIXOS_OZONE_WL = "1";
  };

  system.stateVersion = vars.homeStateVersion;
}
