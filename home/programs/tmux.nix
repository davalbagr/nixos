{pkgs, ...}: {
  enable = true;
  clock24 = true;
  escapeTime = 0;
  mouse = true;
  historyLimit = 10000;
  focusEvents = true;
  baseIndex = 1;
  disableConfirmationPrompt = true;
  terminal = "screen-256color";
  extraConfig = ''
    unbind-key -a
    set -g renumber-windows on
    set -g set-clipboard on

    set -sg terminal-overrides ",*:RGB"
    set -g pane-border-style fg=black,bright
    set -g pane-active-border-style fg=magenta

    set -g status-position top
    set -g status-justify right
    set -g status-style bg=default,fg=magenta
    set -g status-left ""
    set -g status-right " #(cd #{pane_current_path}; git rev-parse --abbrev-ref HEAD)"
    set -g status-right-length 200
    set -g window-status-format "-"
    set -g window-status-current-format "*"
    set -g window-status-current-style "fg=magenta"
    set -g window-status-style "fg=magenta"

    bind -n M-1 select-window -t :1
    bind -n M-2 select-window -t :2
    bind -n M-3 select-window -t :3
    bind -n M-4 select-window -t :4
    bind -n M-5 select-window -t :5
    bind -n M-6 select-window -t :6
    bind -n M-7 select-window -t :7
    bind -n M-8 select-window -t :8
    bind -n M-9 select-window -t :9
    bind -n M-q detach-client
    bind -n M-k select-pane -U
    bind -n M-h select-pane -L
    bind -n M-j select-pane -D
    bind -n M-l select-pane -R
    bind -n M-x kill-pane
    bind -n M-d kill-window
    bind -n M-t new-window
    bind -n M-H split-window -hb
    bind -n M-J split-window -v
    bind -n M-K split-window -vb
    bind -n M-L split-window -h
  '';
}
