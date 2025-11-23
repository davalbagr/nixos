_: {
  vim = {
    viAlias = true;
    vimAlias = true;
    searchCase = "smart";

    lsp = {
      enable = true;
      formatOnSave = true;
      trouble.enable = true;
    };

    theme = {
      enable = true;
      name = "rose-pine";
      style = "main";
    };

    statusline.lualine.enable = true;

    utility = {
      motion.flash-nvim.enable = true;

      oil-nvim = {
        enable = true;
        setupOpts = {
          watch_for_changes = true;
          use_default_keymaps = false;
          view_options = {
            show_hidden = true;
          };
        };
      };

      snacks-nvim = {
        enable = true;
        setupOpts = {
          bigfile = {
            enabled = true;
          };
          indent = {
            enabled = true;
          };
          picker = {
            enabled = true;
          };
          quickfile = {
            enabled = true;
          };
          lazygit = {
            enabled = true;
          };
        };
      };
    };

    options = rec {
      shiftwidth = 4;
      tabstop = shiftwidth;
      visualbell = false;
      number = true;
      softtabstop = shiftwidth;
      smartindent = true;
      relativenumber = true;
      autoread = true;
      swapfile = false;
    };

    languages = {
      nix.enable = true;
      ruby.enable = true;
      go.enable = true;
      css.enable = true;
      html.enable = true;
      sql.enable = true;
      tailwind.enable = true;
      ts.enable = true;
      yaml.enable = true;

      enableExtraDiagnostics = true;
      enableFormat = true;
      enableTreesitter = true;
    };
  };
}
