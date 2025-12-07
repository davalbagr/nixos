{
  pkgs,
  inputs,
  username,
  config,
  ...
}:
{
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    auto-optimise-store = true;
  };

  security.polkit.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        ControllerMode = "bredr";
        Experimental = true;
        FastConnectable = false;
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    timeout = 0;
  };

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Lisbon";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
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
  };

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  nixpkgs.config.allowUnfree = true;

  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
  };

  programs = {
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep 3";
    };
    dconf.enable = true;

    mango.enable = true;

    foot = {
      enable = true;
      enableBashIntegration = true;
      theme = "rose-pine";
      settings = {
        bell = {
          system = "no";
        };
        main = {
          term = "xterm-256color";
          font-size-adjustment = 2;
          font = "JetBrainsMonoNerdFont:size=16";
        };
        mouse = {
          hide-when-typing = "yes";
        };
      };
    };
  };

  security.rtkit.enable = true;
  services = {
    pipewire = {
      enable = true;
      wireplumber.enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
    openssh.enable = true;
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
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${username} = import ../../home {
      inherit
        pkgs
        inputs
        config
        username
        ;
    };
    extraSpecialArgs = { inherit inputs; };
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
      if [ "$(tty)" = "/dev/tty1" ]; then
          exec mango
      fi
    '';
    sessionVariables.NIXOS_OZONE_WL = "1";
    systemPackages = with pkgs; [
      libnotify
      wl-clipboard
      grim
      slurp
      swaybg
      brightnessctl
      cliphist
      satty
      wlr-randr
    ];
  };

  system.stateVersion = "25.11";
}
