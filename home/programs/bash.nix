_: {
  enable = true;

  initExtra = ''
    export FZF_DEFAULT_OPTS="
      	--color=fg:#908caa,bg:#191724,hl:#ebbcba
      	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
      	--color=border:#403d52,header:#31748f,gutter:#191724
      	--color=spinner:#f6c177,info:#9ccfd8
      	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
    export PS0="\e[2 q\2"
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
