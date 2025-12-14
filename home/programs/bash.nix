_: {
  enable = true;

  initExtra = ''
    source $HOME/.profile
  '';

  sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
  };

  shellAliases = {
    lzd = "lazydocker";
    lzg = "lazygit";
    hrc = "heroku run console";
    g = "git";
    ls = "eza -lh --group-directories-first --icons";
    wl-fzl = "cliphist list | fuzzel --dmenu --with-nth 2 | cliphist decode";
    yz = "yazi";
  };
}
