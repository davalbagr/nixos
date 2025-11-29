{pkgs, ...}: let
  slack =
    if pkgs.stdenv.system == "aarch64-linux"
    then "slacky"
    else "slack";
  discord =
    if pkgs.stdenv.system == "aarch64-linux"
    then ''chromium --app "https://discord.com/channels/@me" --new-window''
    else "discord";
in {
  enable = pkgs.stdenv.isLinux;
  package = null;
  portalPackage = null;
  systemd = {
    enable = true;
    variables = ["--all"];
  };
  settings = {
    "$mod" = "SUPER";
    bind =
      [
        "$mod, RETURN, exec, foot"
        "$mod, f, exec, hyprctl clients | grep foot && hyprctl dispatch focuswindow class:foot || foot"
        "$mod, SPACE, exec, fuzzel"
        "$mod, d, exec, hyprctl clients | grep discord && hyprctl dispatch focuswindow class:discord || ${discord}"
        "$mod, s, exec, hyprctl clients | grep ${slack} && hyprctl dispatch focuswindow class:slack || ${slack}"
        "$mod, p, exec, hyprctl clients | grep postman && hyprctl dispatch focuswindow class:postman || postman"
        "$mod, c, exec, hyprctl clients | grep chromium && hyprctl dispatch focuswindow class:chromium-browser || chromium --new-window"
        ''$mod, g, exec, GRIMBLAST_EDITOR="satty --filename" grimblast -f edit output''
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
    env = [
      "ELECTRON_OZONE_PLATFORM_HINT,wayland"
    ];
    decoration = {
      blur.enabled = 0;
      shadow.enabled = 0;
      rounding = 3;
    };
    misc = {
      disable_hyprland_logo = true;
    };
  };
  extraConfig = ''
    exec-once = [workspace 1 silent] foot
    exec-once = [workspace 3 silent] ${discord}
    exec-once = [workspace 4 silent] ${slack}
  '';
}
