_: rec {
  shiftwidth = 4;
  tabstop = shiftwidth;
  visualbell = false;
  number = true;
  softtabstop = shiftwidth;
  smartindent = true;
  relativenumber = true;
  autoread = true;
  swapfile = false;
  termguicolors = true;
  statusline = "%{reg_recording()}%=%{fnamemodify(expand('%:p'),':h:t')}/%t";
  cmdheight = 0;
}
