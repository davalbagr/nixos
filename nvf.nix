{pkgs}: {
  vim = {
    viAlias = true;
    vimAlias = true;
    searchCase = "smart";

    lsp = {
      enable = true;
      formatOnSave = true;
      trouble.enable = true;
    };

    statusline.lualine.enable = true;

    ui = {
      noice.enable = true;
    };

    mini = {
      ai.enable = true;
      comment.enable = true;
      pairs.enable = true;
      surround.enable = true;
      basics.enable = true;
    };

    autocomplete = {
      blink-cmp = {
        enable = true;
      };
    };

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
      termguicolors = true;
    };

    languages = {
      go.enable = true;
      nix.enable = true;
      css.enable = true;
      html.enable = true;
      sql.enable = true;
      tailwind.enable = true;
      ts.enable = true;
      yaml.enable = true;
      ruby.enable = true;
      ruby.lsp.servers = ["ruby_lsp"];

      enableExtraDiagnostics = true;
      enableFormat = true;
      enableTreesitter = true;
    };

    extraPlugins = {
      neotest = {
        package = pkgs.vimPlugins.neotest;
      };

      neotest-rspec = {
        package = pkgs.vimPlugins.neotest-rspec;
      };

      neotest-go = {
        package = pkgs.vimPlugins.neotest-go;
      };

      grug-far = {
        package = pkgs.vimPlugins.grug-far-nvim;
      };
    };
  };
}
