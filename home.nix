{ config, pkgs, inputs, vars, ... }:

{
  home.stateVersion = vars.homeStateVersion;
  home.username = vars.username;

  home.packages = [
    pkgs.ghostty
    pkgs.brave
    pkgs.heroku
  ];

  programs.home-manager.enable = true;
  programs.zoxide.enable = true;
  programs.ripgrep.enable = true;
  programs.yazi.enable = true;
  programs.eza.enable = true;
  programs.fd.enable = true;
  programs.rofi.enable = true;
  programs.lazydocker.enable = true;

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fish = {
   enable = true;
   interactiveShellInit = ''
   '';

   shellAliases = {
    n = "nvim";
    rebuild = "sudo nixos-rebuild switch --flake ~/.config/nixos#$(hostname)";
    lzd = "lazydocker";
    lzg = "lazygit";
    r = "rails";
    hrc = "heroku run console";
    g = "git";
    cl = "clear";
    ls = "eza -lh --group-directories-first --icons";
   };
  };

  services.ssh-agent.enable = true;
  programs.ssh = {
     enable = true;
     extraConfig = ''
       AddKeysToAgent yes
     '';
  };

  programs.git = {
   enable = true;
   settings = {
     user = {
      email = vars.gitUserEmail;
      username = vars.gitUserName;
     };
     init.defaultBranch = "main";
     pull.rebase = true;
   };
  };

  programs.lazygit = {
    enable = true;
    enableFishIntegration = true;
  };

  wayland.windowManager.hyprland = {
   enable = true;
   settings = {
	   monitor = "QEMU Monitor, 2160x1440@144, 0x0, 1";

	   "$mod" = "SUPER";
	   bind = [
	    "$mod, RETURN, exec, ghostty"
	    "$mod, SPACE, exec, rofi -show drun"
	   ];
   };
  };

  programs.neovim = {
    enable = true;
  };

  xdg.configFile."ghostty/config".text = ''
    theme = Rose Pine
    window-decoration = none
  '';
}
