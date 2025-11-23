_: {
  monitor = "QEMU Monitor, 2160x1440@144, 0x0, 1";

  "$mod" = "SUPER";
  bind =
    [
      "$mod, RETURN, exec, ghostty"
      "$mod, SPACE, exec, rofi -show drun"
    ]
    ++ (
      builtins.concatLists (builtins.genList (i: let
          ws = i + 1;
        in [
          "$mod, code:1${toString i}, workspace, ${toString ws}"
          "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
        ])
        9)
    );
}
