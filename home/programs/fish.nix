_: {
  enable = true;

  interactiveShellInit = ''
    set fish_greeting
    if command -q nix-your-shell
      nix-your-shell fish | source
    end
    fish_vi_key_bindings
  '';

  shellInit = ''
    export EDITOR='nvim'
    export VISUAL='nvim'
  '';

  functions = {
    sprune = {
      body = ''
        git fetch - p
        for ref in (git for-each-ref --format='%(refname) %(upstream:track)' refs/heads)
          set parts (string split " " $ref)
          if test "$parts[2]" = "[gone]"
            set branch (string replace "refs/heads/" "" $parts[1])
            git branch -D $branch
      '';
    };
    fzf = {
      body = ''
        set -Ux FZF_DEFAULT_OPTS "
        	--color=fg:#908caa,bg:#191724,hl:#ebbcba
        	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
        	--color=border:#403d52,header:#31748f,gutter:#191724
        	--color=spinner:#f6c177,info:#9ccfd8
        	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
        command fzf
      '';
      wraps = "fzf";
    };
  };

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
