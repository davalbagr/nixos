{pkgs, ...}: {
  enable = true;
  defaultEditor = true;
  plugins = with pkgs.vimPlugins; [
    catppuccin-nvim
  ];
  extraConfig = ''
   set number relativenumber
   set expandtab
   set tabstop=2
   set shiftwidth=2
   set cmdheight=0
   colorscheme catppuccin-mocha
  '';
}
