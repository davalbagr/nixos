_: {
  enable = true;

  initExtra = ''
    source $HOME/.profile
    rgf() (
      RELOAD='reload:rg --column --color=always --smart-case {q} || :'
      OPENER='if [[ $FZF_SELECT_COUNT -eq 0 ]]; then
                kak {1} +{2}  
              else
                kak +cw -q {+f}
              fi'
      fzf --disabled --ansi --multi \
          --bind "start:$RELOAD" --bind "change:$RELOAD" \
          --bind "enter:become:$OPENER" \
          --bind "ctrl-o:execute:$OPENER" \
          --bind 'alt-a:select-all,alt-d:deselect-all,ctrl-/:toggle-preview' \
          --delimiter : \
          --preview 'bat --style=full --color=always --highlight-line {2} {1}' \
          --query "$*"
    )
  '';

  sessionVariables = {
    PAGER  = "bat --decorations=never";
  };

  shellAliases = {
    lzd = "lazydocker";
    hrc = "heroku run console";
    k = "kak";
    ls = "eza -lh --group-directories-first --icons";
    wl-fzf = "cliphist list | fuzzel --dmenu --with-nth 2 | cliphist decode";
    yz = "yazi";
  };
}
