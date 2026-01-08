_: {
  enable = true;
  settings = {
    ui.default-command = "log";
    user = {
      email = "davidaagra@gmail.com";
      name = "davalbagr";
    };
    signing = {
      behaviour = "own";
      backend = "ssh";
      key = "~/.ssh/id_ed25519.pub";
    };
    remotes.origin = {
      auto-track-bookmarks = "da/*";
    };
    git = {
      sign-on-push = true;
    };
  };
}
