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
      cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };
      statusline = {
        left = [ ];
        center = [ ];
        right = [ "file-name" ];
      };
    };
    keys = {
      normal = {
        x = "select_line_below";
        X = "select_line_above";
        C-y = [
          ":write-all"
          ":new"
          ":insert-output yazi"
          ":buffer-close!"
          ":redraw"
          ":reload-all"
        ];
        C-g = [
          ":write-all"
          ":new"
          ":insert-output lazygit"
          ":buffer-close!"
          ":redraw"
          ":reload-all"
        ];
      };
    };
  };
}
