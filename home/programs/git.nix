_: {
  enable = true;
  settings = {
    gpg = {
      format = "ssh";
    };
    user = {
      email = "davidaagra@gmail.com";
      name = "davalbagr";
      signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKEX4YOOt2sClE5+4Rio++bhyeKywJoAlbLXlgrOfUFl davidaagra@gmail.com";
    };
    commit = {
      gpgsign = true;
    };
    init.defaultBranch = "main";
    pull.rebase = true;
  };
}
