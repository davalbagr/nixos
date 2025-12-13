_: {
  enable = true;
  defaultEditor = true;
  settings = {
    theme = "rose_pine";
    editor = {
      line-number = "relative";
      lsp.display-messages = true;
      mouse = false;
      file-picker = {
        hidden = true;
      };
    };
    cursor_shape = {
      insert = "bar";
      normal = "block";
      select = "underline";
    };
    statusline = {
     left = [];
     center = [];
     right = ["file-name"];
    };
    keys = {
      normal = {
        x = "select_line_below";
        X = "select_line_above";
        space = {
          C-y = [
            ":sh rm -f /tmp/unique-file"
            ":insert-output yazi %{buffer_name} --chooser-file=/tmp/unique-file"
            '':insert-output echo "\x1b[?1049h\x1b[?2004h" > /dev/tty" ''
            ":open %sh{cat /tmp/unique-file}"
            ":redraw"
          ];
          C-g = [
            [
              ":write-all"
              ":new"
              ":insert-output lazygit"
              ":buffer-close!"
              ":redraw"
              ":reload-all"
            ]
          ];
        };
      };
    };
  };
}
