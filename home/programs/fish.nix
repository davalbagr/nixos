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
  };

  shellAliases = {
    n = "nvim";
    lzd = "lazydocker";
    lzg = "lazygit";
    r = "rails";
    hrc = "heroku run console";
    g = "git";
    cl = "clear";
    ls = "eza -lh --group-directories-first --icons";
    tl = "tmux list-sessions";
    tn = "tmux new-session -s";
    ta = "tmux attach-session";
  };
}
