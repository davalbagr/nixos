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
  base16Scheme = {
    slug = "rose-pine";
    base00 = "191724";
    base01 = "1f1d2e";
    base02 = "26233a";
    base03 = "6e6a86";
    base04 = "908caa";
    base05 = "e0def4";
    base06 = "e0def4";
    base07 = "524f67";
    base08 = "eb6f92";
    base09 = "f6c177";
    base0A = "ebbcba";
    base0B = "31748f";
    base0C = "9ccfd8";
    base0D = "c4a7e7";
    base0E = "f6c177";
    base0F = "524f67";
  };
  image = ./wallpaper.png;
  targets.nvf.plugin = "base16";
}
