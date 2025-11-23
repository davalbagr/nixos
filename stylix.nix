{pkgs}: {
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
      name = "JetBrainsMono Nerd Font Mono";
    };

    sansSerif = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font Mono";
    };

    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font Mono";
    };
  };
  base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
  image = ./wallpaper.png;
  targets.nvf.enable = false;
}
