{
  pkgs,
  inputs,
  ...
}: let
  slack =
    if pkgs.stdenv.hostPlatform.system == "aarch64-linux"
    then "slacky"
    else "slack";

  wallpaper = "${inputs.self}/wallpaper.png";
in {
  enable = pkgs.stdenv.isLinux;
  settings = ''
    bind=SUPER,q,killclient
    bind=SUPER,m,quit
    bind=SUPER,n,switch_layout
    bind=SUPER,r,reload_config

    bind=SUPER,Return,spawn,foot
    bind=SUPER,space,spawn,fuzzel
    bind=SUPER,s,spawn,grim -g "$(slurp)" - | wl-copy
    bind=SUPER+SHIFT,s,spawn,grim - | satty --filename -
    bind=SUPER,c,spawn,wl-fzl | wl-copy

    bind=SUPER,h,focusdir,left
    bind=SUPER,j,focusdir,down
    bind=SUPER,k,focusdir,up
    bind=SUPER,l,focusdir,right

    cursor_theme=BreezX-RosePine-Linux
    bordercolor=0x00000000
    # rootcolor=
    focuscolor=0xffc4a7e7
    # maximizescreencolor=
    # urgentcolor=
    # scratchpadcolor=
    # globalcolor=
    # overlaycolor=
    no_border_when_single=1
    borderpx=2
    mouse_natural_scrolling=1
    drag_tile_to_tile=1

    tagrule=id:1,layout_name:tile
    tagrule=id:2,layout_name:tile
    tagrule=id:3,layout_name:tile
    tagrule=id:4,layout_name:tile
    tagrule=id:5,layout_name:tile
    tagrule=id:6,layout_name:tile
    tagrule=id:7,layout_name:tile
    tagrule=id:8,layout_name:tile
    tagrule=id:9,layout_name:tile

    bind=SUPER+SHIFT,1,tagsilent,1
    bind=SUPER+SHIFT,2,tagsilent,2
    bind=SUPER+SHIFT,3,tagsilent,3
    bind=SUPER+SHIFT,4,tagsilent,4
    bind=SUPER+SHIFT,5,tagsilent,5
    bind=SUPER+SHIFT,6,tagsilent,6
    bind=SUPER+SHIFT,7,tagsilent,7
    bind=SUPER+SHIFT,8,tagsilent,8
    bind=SUPER+SHIFT,9,tagsilent,9

    bind=SUPER,1,view,1
    bind=SUPER,2,view,2
    bind=SUPER,3,view,3
    bind=SUPER,4,view,4
    bind=SUPER,5,view,5
    bind=SUPER,6,view,6
    bind=SUPER,7,view,7
    bind=SUPER,8,view,8
    bind=SUPER,9,view,9

    animations=0
    enable_hotarea=0

    exec-once=chromium
    exec-once=vesktop
    exec-once=${slack}
    exec-once=wl-paste --watch cliphist store

    windowrule=appid:chromium-browser,tags:2,isopensilent:1
    windowrule=appid:vesktop,tags:3,isopensilent:1
    windowrule=appid:${slack},tags:4,isopensilent:1

    cursor_size=24
    env=XCURSOR_SIZE,24
    env=GTK_IM_MODULE,fcitx
    env=QT_IM_MODULE,fcitx
    env=SDL_IM_MODULE,fcitx
    env=XMODIFIERS,@im=fcitx
    env=GLFW_IM_MODULE,ibus
    env=QT_QPA_PLATFORMTHEME,qt5ct
    env=QT_AUTO_SCREEN_SCALE_FACTOR,1
    env=QT_QPA_PLATFORM,Wayland;xcb
    env=QT_WAYLAND_FORCE_DPI,140
  '';
  autostart_sh = ''
    swaybg -i ${wallpaper} &
  '';
}
