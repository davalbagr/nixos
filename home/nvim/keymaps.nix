_: {
  keymaps = [
    {
      key = "<leader>e";
      mode = [
        "n"
        "v"
      ];
      action = ":Oil<CR>";
      desc = "Open Oil in parent directory";
    }
    {
      key = "<Esc>";
      mode = [ "n" ];
      action = ":noh<CR>";
      desc = "Clear search highlight";
    }
    {
      key = "<leader>sr";
      mode = [
        "n"
        "v"
      ];
      action = ":GrugFar<CR>";
      desc = "Search and Replace";
    }
    {
      key = "<leader>cf";
      mode = [
        "n"
        "v"
      ];
      action = ''function() vim.lsp.buf.format() end'';
      lua = true;
      desc = "Format buffer";
    }
    {
      key = "<leader>p";
      mode = [
        "n"
        "v"
      ];
      action = ''"+p'';
      desc = "Paste from system cliboard";
    }
    {
      key = "<leader>y";
      mode = [
        "n"
        "v"
      ];
      action = ''"+y'';
      desc = "Yank to system clipboard";
    }
    {
      key = "<leader>/";
      mode = [
        "n"
        "v"
      ];
      action = "function() MiniPick.builtin.grep_live() end";
      lua = true;
      desc = "Grep";
    }
    {
      key = "<leader>:";
      mode = [
        "n"
        "v"
      ];
      action = "function() MiniExtra.pickers.history({ scope = ':' }) end";
      lua = true;
      desc = "Command History";
    }
    {
      key = "<leader>fb";
      mode = [
        "n"
        "v"
      ];
      action = "function() MiniPick.builtin.buffers() end";
      lua = true;
      desc = "Buffers";
    }
    {
      key = "<leader><space>";
      mode = [
        "n"
        "v"
      ];
      action = ''function() MiniPick.builtin.files() end'';
      lua = true;
      desc = "Find Files";
    }
    {
      key = "<leader>sgb";
      mode = [
        "n"
        "v"
      ];
      action = "function() MiniExtra.pickers.git_branches() end";
      lua = true;
      desc = "Git Branches";
    }
    {
      key = "<leader>sgl";
      mode = [
        "n"
        "v"
      ];
      action = "function() MiniExtra.pickers.git_log() end";
      lua = true;
      desc = "Git Log";
    }
    {
      key = "<leader>sgS";
      mode = [
        "n"
        "v"
      ];
      action = "function() MiniExtra.pickers.git_stash() end";
      lua = true;
      desc = "Git Stash";
    }
    {
      key = "<leader>sb";
      mode = [
        "n"
        "v"
      ];
      action = "function() MiniExtra.pickers.buf_lines() end";
      lua = true;
      desc = "Buffer Lines";
    }
    {
      key = "<leader>sw";
      mode = [
        "n"
        "x"
        "v"
      ];
      action = "function() MiniPick.builtin.grep({ pattern = vim.fn.expand('<cword>') }) end";
      lua = true;
      desc = "Visual selection or word";
    }
    {
      key = ''<leader>s"'';
      mode = [
        "n"
        "v"
      ];
      action = "function() MiniExtra.pickers.registers() end";
      lua = true;
      desc = "Registers";
    }
    {
      key = "<leader>s/";
      mode = [
        "n"
        "v"
      ];
      action = "function() MiniExtra.pickers.history({ scope = '/' }) end";
      lua = true;
      desc = "Search History";
    }
    {
      key = "<leader>sC";
      mode = [
        "n"
        "v"
      ];
      action = "function() MiniExtra.pickers.commands() end";
      lua = true;
      desc = "Commands";
    }
    {
      key = "<leader>sd";
      mode = [
        "n"
        "v"
      ];
      action = "function() MiniExtra.pickers.diagnostic() end";
      lua = true;
      desc = "Diagnostics";
    }
    {
      key = "<leader>sD";
      mode = [
        "n"
        "v"
      ];
      action = "function() MiniExtra.pickers.diagnostic({ scope = 'current' }) end";
      lua = true;
      desc = "Buffer Diagnostics";
    }
    {
      key = "<leader>sh";
      mode = [
        "n"
        "v"
      ];
      action = "function() MiniPick.builtin.help() end";
      lua = true;
      desc = "Help Pages";
    }
    {
      key = "<leader>sj";
      mode = [
        "n"
        "v"
      ];
      action = "function() MiniExtra.pickers.list({ scope = 'jump' }) end";
      lua = true;
      desc = "Search Jumplist";
    }
    {
      key = "<leader>sk";
      mode = [
        "n"
        "v"
      ];
      action = "function() MiniExtra.pickers.keymaps() end";
      lua = true;
      desc = "Keymaps";
    }
    {
      key = "<leader>sl";
      mode = [
        "n"
        "v"
      ];
      action = "function() MiniExtra.pickers.list({ scope = 'location' }) end";
      lua = true;
      desc = "Location List";
    }
    {
      key = "<leader>sm";
      mode = [
        "n"
        "v"
      ];
      action = "function() MiniExtra.pickers.marks() end";
      lua = true;
      desc = "Marks";
    }
    {
      key = "<leader>sq";
      mode = [
        "n"
        "v"
      ];
      action = "function() MiniExtra.pickers.list({ scope = 'quickfix' }) end";
      lua = true;
      desc = "Quickfix List";
    }
    {
      key = "<leader>sR";
      mode = [
        "n"
        "v"
      ];
      action = "function() MiniExtra.builtin.resume() end";
      lua = true;
      desc = "Resume";
    }
    {
      key = "<leader>su";
      mode = [
        "n"
        "v"
      ];
      action = "function() MiniExtra.pickers.list({ scope = 'change' }) end";
      lua = true;
      desc = "Undo History";
    }
    {
      key = "gd";
      mode = [
        "n"
        "v"
      ];
      action = "function() MiniExtra.pickers.lsp({ scope = 'definition' }) end";
      lua = true;
      desc = "Goto Definition";
    }
    {
      key = "gD";
      mode = [
        "n"
        "v"
      ];
      action = "function() MiniExtra.pickers.lsp({ scope = 'declaration' }) end";
      lua = true;
      desc = "Goto Declaration";
    }
    {
      key = "gr";
      mode = [
        "n"
        "v"
      ];
      action = "function() MiniExtra.pickers.lsp({ scope = 'references' }) end";
      lua = true;
      desc = "References";
    }
    {
      key = "gI";
      mode = [
        "n"
        "v"
      ];
      action = "function() MiniExtra.pickers.lsp({ scope = 'implementation' }) end";
      lua = true;
      desc = "Goto Implementation";
    }
    {
      key = "gy";
      mode = [
        "n"
        "v"
      ];
      action = "function() MiniExtra.pickers.lsp({ scope = 'definition' }) end";
      lua = true;
      desc = "Goto T[y]pe Definition";
    }
    {
      key = "<leader>ss";
      mode = [
        "n"
        "v"
      ];
      action = "function() MiniExtra.pickers.lsp({ scope = 'document_symbols' }) end";
      lua = true;
      desc = "LSP Symbols";
    }
    {
      key = "<leader>sS";
      mode = [
        "n"
        "v"
      ];
      action = "function() MiniExtra.pickers.lsp({ scope = 'workspace_symbol' }) end";
      lua = true;
      desc = "LSP Workspace Symbols";
    }
  ];
}
