_: {
  enable = true;

  initExtra = ''
    source $HOME/.profile
  '';

  sessionVariables = {
    PAGER  = "bat --decorations=never";
  };

  shellAliases = {
    lzd = "lazydocker";
    hrc = "heroku run console";
    ls = "eza -lh --group-directories-first --icons";
    wl-fzf = "cliphist list | fuzzel --dmenu --with-nth 2 | cliphist decode";
    yz = "yazi";
  };
}
