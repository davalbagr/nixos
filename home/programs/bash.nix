_: {
  enable = true;

  initExtra = ''
    source $HOME/.profile
  '';

  sessionVariables = {
    PAGER  = "bat --decorations=never";
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  shellAliases = {
    lzd = "lazydocker";
    hrc = "heroku run console";
    n = "nvim";
    oc = "nix shell nixpkgs#nodejs -c bash -lc \"opencode\"";
    ocs = "nix shell nixpkgs#nodejs -c bash -lc \"opencode serve\"";
    ls = "eza -lh --group-directories-first --icons";
    wl-fzf = "cliphist list | fuzzel --dmenu --with-nth 2 | cliphist decode";
    yz = "yazi";
  };
}
