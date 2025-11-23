{
  config,
  pkgs,
  inputs,
  vars,
  ...
}: {
  home = {
    stateVersion = vars.homeStateVersion;
    username = vars.username;

    packages = with pkgs; [
      ghostty
      brave
      heroku
      nix-your-shell
      nixfmt-rfc-style
      vesktop
      hyprshot
    ];
  };

  programs = {
    home-manager.enable = true;
    ripgrep.enable = true;
    yazi.enable = true;
    eza.enable = true;
    fd.enable = true;
    rofi.enable = true;
    lazydocker.enable = true;

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };

    starship = {
      enable = true;
      enableFishIntegration = true;
    };

    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting
        if command -q nix-your-shell
          nix-your-shell fish | source
        end
      '';

      shellAliases = {
        n = "nvim";
        lzd = "lazydocker";
        lzg = "lazygit";
        r = "rails";
        hrc = "heroku run console";
        g = "git";
        cl = "clear";
        ls = "eza -lh --group-directories-first --icons";
      };
    };

    ssh = {
      enable = true;
      extraConfig = ''
        AddKeysToAgent yes
      '';
    };

    git = {
      enable = true;
      settings = {
        user = {
          email = vars.gitUserEmail;
          name = vars.gitUserName;
        };
        init.defaultBranch = "main";
        pull.rebase = true;
      };
    };

    lazygit = {
      enable = true;
      enableFishIntegration = true;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    settings = {
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
    };
  };

  xdg.configFile."ghostty/config".text = ''
    theme = Rose Pine
    window-decoration = none
  '';

  services.ssh-agent.enable = true;
}
