_: {
  enable = true;
  clock24 = true;
  escapeTime = 0;
  mouse = true;
  focusEvents = true;
  disableConfirmationPrompt = true;
  extraConfig = ''
    set-option -g status-position top
    set -g status-justify right
    set -g status-left ""
    set -g default-terminal "tmux-256color"
    set -ag terminal-overrides ",*:RGB"
    set -g status-right "#[fg=black,bright]#S"
    set -g status-style bg=default,fg=black,bright
    set -g window-status-format "●"
    set -g window-status-current-format "●"
    set -g window-status-current-style "#{?window_zoomed_flag,fg=yellow,fg=magenta,nobold}"
    set -g window-status-bell-style "fg=red,nobold"
    set -g renumber-windows on
    set -g pane-border-lines simple
    set -g set-clipboard on
  '';
}
