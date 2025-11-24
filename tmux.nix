{pkgs}: {
  enable = true;
  clock24 = true;
  terminal = "screen-256color";
  focusEvents = true;
  prefix = "C-s";
  mouse = true;
  customPaneNavigationAndResize = true;
  plugins = [
    pkgs.tmuxPlugins.rose-pine
  ];
  extraConfig = ''
    set -g @plugin 'rose-pine/tmux'
    set -g @rose_pine_variant 'main'
  '';
}
