_: {
  monitor = "QEMU Monitor, 2160x1440@144, 0x0, 1";

  "$mod" = "SUPER";
  bind =
    [
      "$mod, RETURN, exec, foot"
      "$mod, SPACE, exec, rofi -show drun"
      "$mod, d, exec, hyprctl clients | grep vesktop && hyprctl dispatch focuswindow class:vesktop || setsid -f vesktop"
      "$mod, s, exec, slack"
      "$mod, c, exec, hyprctl clients | grep chromium && hyprctl dispatch focuswindow class:chromium-browser || setsid -f chromium"
      "$mod, w, killactive,"
      "$mod, h, movefocus, l"
      "$mod, l, movefocus, r"
      "$mod, k, movefocus, u"
      "$mod, j, movefocus, d"
    ]
    ++ (
      builtins.concatLists (builtins.genList (
          x: let
            ws = let
              c = (x + 1) / 10;
            in
              builtins.toString (x + 1 - (c * 10));
          in [
            "$mod, ${ws}, workspace, ${toString (x + 1)}"
            "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ]
        )
        10)
    );
}
