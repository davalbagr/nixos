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
      gitsigns = {
        enable = true;
      };
    };

    lsp = {
      enable = true;
      formatOnSave = true;
      trouble.enable = true;
    };

    ui = {
      noice.enable = true;
    };

    mini = {
      ai.enable = true;
      comment.enable = true;
      pairs.enable = true;
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
          search_method = "cover_or_nearest";
        };
      };
      basics.enable = true;
    };

    autocomplete = {
      blink-cmp.enable = true;
    };

    telescope = {
      enable = true;
      extensions = [
        {
          name = "fzf";
          packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
          setup = {fzf = {fuzzy = true;};};
        }
      ];
      mappings = {
        liveGrep = "<leader>/";
        findFiles = "<leader><leader>";
      };
    };

    utility = {
      motion.flash-nvim.enable = true;

      oil-nvim = {
        enable = true;
        setupOpts = {
          lsp_file_methods = {
            autosave_changes = true;
          };
          watch_for_changes = true;
          use_default_keymaps = true;
          view_options = {
            show_hidden = true;
          };
        };
      };

      snacks-nvim = {
        enable = true;
        setupOpts = {
          bigfile.enabled = true;
          indent.enabled = true;
          quickfile.enabled = true;
          words.enabled = true;
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
      statusline = "%=%f";
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

    keymaps = [
      {
        key = "<leader>e";
        mode = ["n"];
        action = ":Oil<CR>";
        desc = "Open Oil in parent directory";
      }
      {
        key = "gd";
        mode = ["n"];
        action = "function() vim.lsp.buf.definition() end";
        lua = true;
        desc = "Goto definition";
      }
      {
        key = "gh";
        mode = ["n"];
        action = "function() vim.lsp.buf.hover() end";
        lua = true;
        desc = "Show hover info";
      }
      {
        key = "<leader>sr";
        mode = ["n"];
        action = ":GrugFar<CR>";
        desc = "Search and Replace";
      }
      {
        key = "<leader>p";
        mode = ["n" "v"];
        action = ''"+p'';
        desc = "Paste from system cliboard";
      }
      {
        key = "<leader>y";
        mode = ["n" "v"];
        action = ''"+y'';
        desc = "Yank to system clipboard";
      }
      {
        key = "<leader>ff";
        mode = ["n" "v"];
        action = '':Telescope git_files<CR>'';
        desc = "Search through files in git";
      }
      {
        key = "<leader>fk";
        mode = ["n" "v"];
        action = '':Telescope keymaps<CR>'';
        desc = "Search through normal mode keymaps";
      }
    ];
  };
}
