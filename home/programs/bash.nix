_: {
  enable = true;

  initExtra = ''
    export EDITOR="nvim"
    export VISUAL="nvim"
    set -o vi
  '';

  shellAliases = {
    n = "nvim";
    lzd = "lazydocker";
    lzg = "lazygit";
    hrc = "heroku run console";
    g = "git";
    cl = "clear";
    ls = "eza -lh --group-directories-first --icons";
    tl = "tmux list-sessions";
    tn = "tmux new-session -s";
    ta = "tmux attach-session";
    wl-fzl = "cliphist list | fuzzel --dmenu --with-nth 2 | cliphist decode";
    yz = "yazi";
  };
}
