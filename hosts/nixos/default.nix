{ config, pkgs, inputs, vars, ... }:

{ 
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users.${vars.username} = {
    isNormalUser = true;
    description = "David Agra";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  services.getty.autologinUser = vars.username;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };


  programs.hyprland.enable = true;
  services.xserver.enable = true;
  services.xserver.desktopManager.session = [{
    name = "hyprland";
    start = ''
     ${pkgs.hyprland}/bin/Hyprland
    '';
  }];

  home-manager = {
     users.${vars.username} = import ../../home.nix {
      inherit config pkgs inputs vars;
     };
     extraSpecialArgs = { inherit inputs vars; };
  };

  services.openssh.enable = true;

  system.stateVersion = vars.homeStateVersion;
}
