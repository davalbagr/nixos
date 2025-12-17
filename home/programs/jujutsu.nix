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
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKEX4YOOt2sClE5+4Rio++bhyeKywJoAlbLXlgrOfUFl davidaagra@gmail.com";
    };
    remotes.origin = {
      auto-track-bookmarks = "da/*";
    };
    git = {
      sign-on-push = true;
    };
  };
}
