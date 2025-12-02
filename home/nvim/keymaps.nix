_: {
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
      key = "<leader>Y";
      mode = ["n" "v"];
      action = ''"+Y'';
      desc = "Yank to system clipboard (Y)";
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
      key = "<leader>fb";
      mode = ["n" "v"];
      action = "function() Snacks.picker.buffers() end";
      lua = true;
      desc = "Buffers";
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
      key = "<leader>sgb";
      mode = ["n" "v"];
      action = "function() Snacks.picker.git_branches() end";
      lua = true;
      desc = "Git Branches";
    }
    {
      key = "<leader>sgl";
      mode = ["n" "v"];
      action = "function() Snacks.picker.git_log() end";
      lua = true;
      desc = "Git Log";
    }
    {
      key = "<leader>sgS";
      mode = ["n" "v"];
      action = "function() Snacks.picker.git_stash() end";
      lua = true;
      desc = "Git Stash";
    }
    {
      key = "<leader>sgi";
      mode = ["n" "v"];
      action = "function() Snacks.picker.gh_issue() end";
      lua = true;
      desc = "GitHub Issues (open)";
    }
    {
      key = "<leader>sgI";
      mode = ["n" "v"];
      action = "function() Snacks.picker.gh_issue({ state = \"all\" }) end";
      lua = true;
      desc = "GitHub Issues (all)";
    }
    {
      key = "<leader>sgp";
      mode = ["n" "v"];
      action = "function() Snacks.picker.gh_pr() end";
      lua = true;
      desc = "GitHub Pull Requests (open)";
    }
    {
      key = "<leader>sgP";
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
}
