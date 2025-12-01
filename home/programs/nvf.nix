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

    mini = {
      ai.enable = true;
      pairs.enable = true;
      icons.enable = true;
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
          picker.enabled = true;
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
        key = "gh";
        mode = ["n"];
        action = "function() vim.lsp.buf.hover() end";
        lua = true;
        desc = "Show hover info";
      }
      {
        key = "<leader>sr";
        mode = ["n" "v"];
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
        key = "<leader><space>";
        mode = ["n" "v"];
        action = "function() Snacks.picker.smart() end";
        lua = true;
        desc = "Smart Find Files";
      }
      {
        key = "<leader>,";
        mode = ["n" "v"];
        action = "function() Snacks.picker.buffers() end";
        lua = true;
        desc = "Buffers";
      }
      {
        key = "<leader>/";
        mode = ["n" "v"];
        action = "function() Snacks.picker.grep() end";
        lua = true;
        desc = "Grep";
      }
      {
        key = "<leader>:";
        mode = ["n" "v"];
        action = "function() Snacks.picker.command_history() end";
        lua = true;
        desc = "Command History";
      }
      {
        key = "<leader>n";
        mode = ["n" "v"];
        action = "function() Snacks.picker.notifications() end";
        lua = true;
        desc = "Notification History";
      }
      {
        key = "<leader>e";
        mode = ["n" "v"];
        action = "function() Snacks.explorer() end";
        lua = true;
        desc = "File Explorer";
      }
      {
        key = "<leader>fb";
        mode = ["n" "v"];
        action = "function() Snacks.picker.buffers() end";
        lua = true;
        desc = "Buffers";
      }
      {
        key = "<leader>fc";
        mode = ["n" "v"];
        action = "function() Snacks.picker.files({ cwd = vim.fn.stdpath(\"config\") }) end";
        lua = true;
        desc = "Find Config File";
      }
      {
        key = "<leader>ff";
        mode = ["n" "v"];
        action = "function() Snacks.picker.files() end";
        lua = true;
        desc = "Find Files";
      }
      {
        key = "<leader>fg";
        mode = ["n" "v"];
        action = "function() Snacks.picker.git_files() end";
        lua = true;
        desc = "Find Git Files";
      }
      {
        key = "<leader>fp";
        mode = ["n" "v"];
        action = "function() Snacks.picker.projects() end";
        lua = true;
        desc = "Projects";
      }
      {
        key = "<leader>fr";
        mode = ["n" "v"];
        action = "function() Snacks.picker.recent() end";
        lua = true;
        desc = "Recent";
      }
      {
        key = "<leader>gb";
        mode = ["n" "v"];
        action = "function() Snacks.picker.git_branches() end";
        lua = true;
        desc = "Git Branches";
      }
      {
        key = "<leader>gl";
        mode = ["n" "v"];
        action = "function() Snacks.picker.git_log() end";
        lua = true;
        desc = "Git Log";
      }
      {
        key = "<leader>gL";
        mode = ["n" "v"];
        action = "function() Snacks.picker.git_log_line() end";
        lua = true;
        desc = "Git Log Line";
      }
      {
        key = "<leader>gs";
        mode = ["n" "v"];
        action = "function() Snacks.picker.git_status() end";
        lua = true;
        desc = "Git Status";
      }
      {
        key = "<leader>gS";
        mode = ["n" "v"];
        action = "function() Snacks.picker.git_stash() end";
        lua = true;
        desc = "Git Stash";
      }
      {
        key = "<leader>gd";
        mode = ["n" "v"];
        action = "function() Snacks.picker.git_diff() end";
        lua = true;
        desc = "Git Diff (Hunks)";
      }
      {
        key = "<leader>gf";
        mode = ["n" "v"];
        action = "function() Snacks.picker.git_log_file() end";
        lua = true;
        desc = "Git Log File";
      }
      {
        key = "<leader>gi";
        mode = ["n" "v"];
        action = "function() Snacks.picker.gh_issue() end";
        lua = true;
        desc = "GitHub Issues (open)";
      }
      {
        key = "<leader>gI";
        mode = ["n" "v"];
        action = "function() Snacks.picker.gh_issue({ state = \"all\" }) end";
        lua = true;
        desc = "GitHub Issues (all)";
      }
      {
        key = "<leader>gp";
        mode = ["n" "v"];
        action = "function() Snacks.picker.gh_pr() end";
        lua = true;
        desc = "GitHub Pull Requests (open)";
      }
      {
        key = "<leader>gP";
        mode = ["n" "v"];
        action = "function() Snacks.picker.gh_pr({ state = \"all\" }) end";
        lua = true;
        desc = "GitHub Pull Requests (all)";
      }
      {
        key = "<leader>sb";
        mode = ["n" "v"];
        action = "function() Snacks.picker.lines() end";
        lua = true;
        desc = "Buffer Lines";
      }
      {
        key = "<leader>sB";
        mode = ["n" "v"];
        action = "function() Snacks.picker.grep_buffers() end";
        lua = true;
        desc = "Grep Open Buffers";
      }
      {
        key = "<leader>sg";
        mode = ["n" "v"];
        action = "function() Snacks.picker.grep() end";
        lua = true;
        desc = "Grep";
      }
      {
        key = "<leader>sw";
        mode = ["n" "x" "v"];
        action = "function() Snacks.picker.grep_word() end";
        lua = true;
        desc = "Visual selection or word";
      }
      {
        key = ''<leader>s"'';
        mode = ["n" "v"];
        action = "function() Snacks.picker.registers() end";
        lua = true;
        desc = "Registers";
      }
      {
        key = "<leader>s/";
        mode = ["n" "v"];
        action = "function() Snacks.picker.search_history() end";
        lua = true;
        desc = "Search History";
      }
      {
        key = "<leader>sa";
        mode = ["n" "v"];
        action = "function() Snacks.picker.autocmds() end";
        lua = true;
        desc = "Autocmds";
      }
      {
        key = "<leader>sc";
        mode = ["n" "v"];
        action = "function() Snacks.picker.command_history() end";
        lua = true;
        desc = "Command History";
      }
      {
        key = "<leader>sC";
        mode = ["n" "v"];
        action = "function() Snacks.picker.commands() end";
        lua = true;
        desc = "Commands";
      }
      {
        key = "<leader>sd";
        mode = ["n" "v"];
        action = "function() Snacks.picker.diagnostics() end";
        lua = true;
        desc = "Diagnostics";
      }
      {
        key = "<leader>sD";
        mode = ["n" "v"];
        action = "function() Snacks.picker.diagnostics_buffer() end";
        lua = true;
        desc = "Buffer Diagnostics";
      }
      {
        key = "<leader>sh";
        mode = ["n" "v"];
        action = "function() Snacks.picker.help() end";
        lua = true;
        desc = "Help Pages";
      }
      {
        key = "<leader>sH";
        mode = ["n" "v"];
        action = "function() Snacks.picker.highlights() end";
        lua = true;
        desc = "Highlights";
      }
      {
        key = "<leader>si";
        mode = ["n" "v"];
        action = "function() Snacks.picker.icons() end";
        lua = true;
        desc = "Icons";
      }
      {
        key = "<leader>sj";
        mode = ["n" "v"];
        action = "function() Snacks.picker.jumps() end";
        lua = true;
        desc = "Jumps";
      }
      {
        key = "<leader>sk";
        mode = ["n" "v"];
        action = "function() Snacks.picker.keymaps() end";
        lua = true;
        desc = "Keymaps";
      }
      {
        key = "<leader>sl";
        mode = ["n" "v"];
        action = "function() Snacks.picker.loclist() end";
        lua = true;
        desc = "Location List";
      }
      {
        key = "<leader>sm";
        mode = ["n" "v"];
        action = "function() Snacks.picker.marks() end";
        lua = true;
        desc = "Marks";
      }
      {
        key = "<leader>sM";
        mode = ["n" "v"];
        action = "function() Snacks.picker.man() end";
        lua = true;
        desc = "Man Pages";
      }
      {
        key = "<leader>sq";
        mode = ["n" "v"];
        action = "function() Snacks.picker.qflist() end";
        lua = true;
        desc = "Quickfix List";
      }
      {
        key = "<leader>sR";
        mode = ["n" "v"];
        action = "function() Snacks.picker.resume() end";
        lua = true;
        desc = "Resume";
      }
      {
        key = "<leader>su";
        mode = ["n" "v"];
        action = "function() Snacks.picker.undo() end";
        lua = true;
        desc = "Undo History";
      }
      {
        key = "gd";
        mode = ["n" "v"];
        action = "function() Snacks.picker.lsp_definitions() end";
        lua = true;
        desc = "Goto Definition";
      }
      {
        key = "gD";
        mode = ["n" "v"];
        action = "function() Snacks.picker.lsp_declarations() end";
        lua = true;
        desc = "Goto Declaration";
      }
      {
        key = "gr";
        mode = ["n" "v"];
        action = "function() Snacks.picker.lsp_references() end";
        lua = true;
        desc = "References";
      }
      {
        key = "gI";
        mode = ["n" "v"];
        action = "function() Snacks.picker.lsp_implementations() end";
        lua = true;
        desc = "Goto Implementation";
      }
      {
        key = "gy";
        mode = ["n" "v"];
        action = "function() Snacks.picker.lsp_type_definitions() end";
        lua = true;
        desc = "Goto T[y]pe Definition";
      }
      {
        key = "gai";
        mode = ["n" "v"];
        action = "function() Snacks.picker.lsp_incoming_calls() end";
        lua = true;
        desc = "C[a]lls Incoming";
      }
      {
        key = "gao";
        mode = ["n" "v"];
        action = "function() Snacks.picker.lsp_outgoing_calls() end";
        lua = true;
        desc = "C[a]lls Outgoing";
      }
      {
        key = "<leader>ss";
        mode = ["n" "v"];
        action = "function() Snacks.picker.lsp_symbols() end";
        lua = true;
        desc = "LSP Symbols";
      }
      {
        key = "<leader>sS";
        mode = ["n" "v"];
        action = "function() Snacks.picker.lsp_workspace_symbols() end";
        lua = true;
        desc = "LSP Workspace Symbols";
      }
    ];
  };
}
