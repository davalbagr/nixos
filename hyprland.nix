_: {
  monitor = "QEMU Monitor, 2160x1440@144, 0x0, 1";

  "$mod" = "SUPER";
  bind =
    [
      "$mod, RETURN, exec, foot"
      "$mod, SPACE, exec, rofi -show drun"
      "$mod, d, exec, discord"
      "$mod, s, exec, slack"
      "$mod, c, exec, chromium"
      "$mod, w, killactive,"
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
