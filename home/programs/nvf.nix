{ pkgs, ... }:
{
  enable = true;
  settings.vim = {
    git.vim-fugitive.enable = true;

    extraPlugins = {
      neotest.package = pkgs.vimPlugins.neotest;
      neotest-rspec.package = pkgs.vimPlugins.neotest-rspec;
      neotest-go.package = pkgs.vimPlugins.neotest-go;
      grug-far.package = pkgs.vimPlugins.grug-far-nvim;
    };

    mini = {
      ai.enable = true;
      basics.enable = true;
      diff.enable = true;
      surround.enable = true;
      pick.enable = true;
      extra.enable = true;
      icons.enable = true;
    };

    languages = import ../nvim/languages.nix { };
    options = import ../nvim/options.nix { };
    inherit (import ../nvim/keymaps.nix { }) keymaps;

    theme = {
      enable = true;
      name = "rose-pine";
      style = "main";
      transparent = true;
    };

    lsp.enable = true;

    searchCase = "smart";
  };
}
