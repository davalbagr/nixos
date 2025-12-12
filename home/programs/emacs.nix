_:
{
  enable = true;
  extraPackages =
    epkgs: with epkgs; [
      magit
      vterm
      catppuccin-theme
      tree-sitter-langs
      treesit-grammars.with-all-grammars
    ];
  extraConfig = ''
    (setq inhibit-startup-message t)
    (tool-bar-mode 0)
    (menu-bar-mode 0)
    (scroll-bar-mode 0)
    (tooltip-mode 0)
    (set-fringe-mode 10)
    (setq native-comp-async-report-warnings-errors nil)
    (setq visible-bell nil)
    (global-set-key (kbd "<escape>") 'keyboard-escape-quit)
    (set-face-attribute 'default nil :font "JetBrainsMonoNerdFont" :height 200)
    (load-theme 'catppuccin :no-confirm)
    (setq read-file-name-completion-ignore-case t)
    (global-set-key (kbd "s-[") #'next-buffer)
    (global-set-key (kbd "s-]") #'previous-buffer)
    (add-hook 'dired-mode-hook #'dired-hide-details-mode)
    (global-auto-revert-mode 1)
  '';
}
