{ config, pkgs, inputs, vars, ... }:

{
  home.stateVersion = vars.homeStateVersion;
  home.username = vars.username;

  home.packages = [
    pkgs.ghostty
  ];

  programs.home-manager.enable = true;

  programs.starship.enable = true;

  programs.fish = {
   enable = true;
   shellAliases = {
    n = "nvim";
    rebuild = "sudo nixos-rebuild switch --flake ~/.config/nixos#$(hostname)";
   };
  };

  programs.git = {
   enable = true;
   settings = {
     user = {
      email = vars.gitUserEmail;
      username = vars.gitUserName;
     };
     init.defaultBranch = "main";
   };
  };

  wayland.windowManager.hyprland = {
   enable = true;
   settings = {
	   monitor = "QEMU Monitor, 2160x1440@144, 0x0, 1";

	   "$mod" = "SUPER";
	   bind = [
	    "$mod, RETURN, exec, ghostty"
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
