{
  pkgs,
  inputs,
  ...
}: let
  wallpaper = "${inputs.self}/wallpaper.png";
in {
  enable = pkgs.stdenv.isLinux;
  settings = ''
    bind=SUPER,w,killclient
    bind=SUPER,m,quit
    bind=SUPER,n,switch_layout
    bind=SUPER,r,reload_config

    bind=SUPER,Return,spawn,foot
    bind=SUPER,space,spawn,fuzzel

    bind=SUPER,h,focusdir,left
    bind=SUPER,j,focusdir,down
    bind=SUPER,k,focusdir,up
    bind=SUPER,l,focusdir,right

    # cursor_theme=
    # bordercolor=
    # rootcolor=
    # focuscolor=
    # maximizescreencolor=
    # urgentcolor=
    # scratchpadcolor=
    # globalcolor=
    # overlaycolor=


  '';
  autostart_sh = ''
    swaybg -i ${wallpaper} -m center
  '';
}
