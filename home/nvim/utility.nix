_: {
  motion.flash-nvim.enable = true;

  oil-nvim = {
    enable = true;
    setupOpts.watch_for_changes = true;
  };

  snacks-nvim = {
    enable = true;
    setupOpts.picker = {
      enabled = true;
      icons.files.enabled = false;
    };
  };
}
