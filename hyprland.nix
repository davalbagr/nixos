{cfg}: {
  "$mod" = "SUPER";
  bind = let
    slack =
      if cfg.system == "aarch64-linux"
      then "slacky"
      else "slack";
  in
    [
      "$mod, RETURN, exec, uwsm app -- foot"
      "$mod, SPACE, exec, uwsm app -- ulauncher"
      "$mod, d, exec, hyprctl clients | grep vesktop && hyprctl dispatch focuswindow class:vesktop || uwsm app -- vesktop"
      "$mod, s, exec, hyprctl clients | grep ${slack} && hyprctl dispatch focuswindow class:slack || uwsm app -- ${slack}"
      "$mod, p, exec, hyprctl clients | grep postman && hyprctl dispatch focuswindow class:postman || uwsm app -- postman"
      "$mod, c, exec, hyprctl clients | grep chromium && hyprctl dispatch focuswindow class:chromium-browser || uwsm app -- chromium"
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
