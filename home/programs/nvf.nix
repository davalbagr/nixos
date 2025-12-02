{pkgs, ...}: {
  enable = true;
  settings.vim = {
    viAlias = true;
    vimAlias = true;
    searchCase = "smart";
    theme = {
      enable = true;
      name = "rose-pine";
      style = "main";
      transparent = true;
    };
    git = {
      vim-fugitive.enable = true;
      gitsigns.enable = true;
    };

    lsp = {
      enable = true;
      formatOnSave = true;
      trouble.enable = true;
    };

    mini = {
      ai.enable = true;
      basics.enable = true;
      surround = {
        enable = true;
        setupOpts = {
          mappings = {
            add = "gsa";
            delete = "gsd";
            replace = "gsr";
            highlight = "";
            find = "";
            find_left = "";
          };
        };
      };
    };

    autocomplete.blink-cmp.enable = true;

    utility = {
      motion.flash-nvim.enable = true;

      oil-nvim = {
        enable = true;
        setupOpts.watch_for_changes = true;
      };

      snacks-nvim = {
        enable = true;
        setupOpts = {
          bigfile.enabled = true;
          picker = {
            enabled = true;
            icons.files.enabled = false;
          };
          gh.enabled = true;
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
      statusline = "%{reg_recording()}%=%f";
      cmdheight = 0;
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
      neotest.package = pkgs.vimPlugins.neotest;
      neotest-rspec.package = pkgs.vimPlugins.neotest-rspec;
      neotest-go.package = pkgs.vimPlugins.neotest-go;
      grug-far.package = pkgs.vimPlugins.grug-far-nvim;
    };

    inherit (import ../nvim/keymaps.nix {}) keymaps;
  };
}
