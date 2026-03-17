_: {
  enable = true;
  extraConfig = ''
    local wezterm = require 'wezterm'
    local config = {}

    config.color_scheme = 'Catppuccin Mocha'
    config.hide_tab_bar_if_only_one_tab = true
    config.audible_bell = "Disabled"

    return config
  '';
}
