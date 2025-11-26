{
  config,
  username,
  ...
}: {
  enable = true;
  extraConfig = {
    show-icons = true;
    display-drun = "Apps";
    display-run = "Run";
    display-filebrowser = "Files";
    display-window = "Windows";
    drun-display-format = ''{name}\n[<span weight='light' size='small'><i>({generic})</i></span>]'';
    window-format = ''Class : {c}\nWorkspace : {w}'';
  };
  theme = let
    inherit (config.home-manager.users.${username}.lib.formats.rasi) mkLiteral;
  in {
    "*" = {
      bg = mkLiteral "#${config.stylix.base16Scheme.base00}";
      bg-alt = mkLiteral "#${config.stylix.base16Scheme.base09}";
      foreground = mkLiteral "#${config.stylix.base16Scheme.base01}";
      selected = mkLiteral "#${config.stylix.base16Scheme.base08}";
      active = mkLiteral "#${config.stylix.base16Scheme.base0B}";
      text-selected = mkLiteral "#${config.stylix.base16Scheme.base00}";
      text-color = mkLiteral "#${config.stylix.base16Scheme.base05}";
      border-color = mkLiteral "#${config.stylix.base16Scheme.base0F}";
      urgent = mkLiteral "#${config.stylix.base16Scheme.base0E}";
    };
    "window" = {
      transparency = "real";
      location = mkLiteral "center";
      anchor = mkLiteral "center";
      fullscreen = false;
      width = "500px";
      x-offset = "0px";
      y-offset = "0px";
      enabled = true;
      margin = "0px";
      padding = "0px";
      border-radius = "10px";
      cursor = "default";
      background-color = mkLiteral "#${config.stylix.base16Scheme.base0F}";
    };
    "entry" = {
      enabled = true;
      padding = mkLiteral "12px 16px";
      border = mkLiteral "0px";
      border-radius = mkLiteral "10px";
      border-color = mkLiteral "gray/30%";
      background-color = mkLiteral "gray/15%";
      text-color = mkLiteral "black";
      cursor = mkLiteral "text";
      placeholder = "Search...";
      placeholder-color = mkLiteral "inherit";
      vertical-align = mkLiteral "0.5";
      horizontal-align = mkLiteral "0.0";
    };
    "textbox" = {
      padding = mkLiteral "0px";
      border-radius = mkLiteral "0px";
      text-color = mkLiteral "black";
      vertical-align = mkLiteral "0.5";
      horizontal-align = mkLiteral "0.0";
    };
    "error-message" = {
      padding = mkLiteral "20px";
      background-color = mkLiteral "white";
      text-color = mkLiteral "#${config.stylix.base16Scheme.base09}";
    };
    "mode-switcher" = {
      enabled = true;
      expand = false;
      spacing = mkLiteral "15px";
      background-color = mkLiteral "transparent";
    };
    "element-text" = {
      background-color = mkLiteral "inherit";
      text-color = mkLiteral "inherit";
      cursor = mkLiteral "inherit";
      vertical-align = mkLiteral "0.5";
      horizontal-align = mkLiteral "0.0";
    };
    "element" = {
      enabled = true;
      spacing = mkLiteral "10px";
      margin = mkLiteral "0px";
      padding = mkLiteral "10px";
      border = mkLiteral "0px solid";
      border-radius = mkLiteral "10px";
      background-color = mkLiteral "transparent";
      text-color = mkLiteral "black";
      cursor = mkLiteral "pointer";
    };
    "textbox-prompt-colon" = {
      enabled = true;
      expand = false;
      padding = mkLiteral "12px 16px";
      border = mkLiteral "0px";
      border-radius = mkLiteral "10px";
      border-color = mkLiteral "gray/30%";
      background-color = mkLiteral "gray/15%";
      text-color = mkLiteral "black";
      str = "";
    };
    "listview" = {
      enabled = true;
      columns = 1;
      lines = 5;
      cycle = true;
      dynamic = true;
      scrollbar = false;
      layout = mkLiteral "vertical";
      reverse = false;
      fixed-height = true;
      fixed-columns = true;
      spacing = mkLiteral "10px";
      background-color = mkLiteral "transparent";
      cursor = "default";
    };
    "mainbox" = {
      enabled = true;
      spacing = mkLiteral "15px";
      padding = mkLiteral "30px";
      background-color = mkLiteral "transparent";
      children = map mkLiteral ["inputbar" "mode-switcher" "listview"];
    };
    "inputbar" = {
      enabled = true;
      spacing = mkLiteral "15px";
      margin = mkLiteral "0px";
      background-color = mkLiteral "transparent";
      children = map mkLiteral ["textbox-prompt-colon" "entry"];
    };
    "element selected.normal" = {
      border-radius = mkLiteral "10px";
      background-image = mkLiteral "linear-gradient(to right, #FF9030, #FFC99B)";
      text-color = mkLiteral "black";
    };
    "element normal.active" = {
      background-image = mkLiteral "linear-gradient(to right, #19B466, #7BF4B7)";
      text-color = mkLiteral "black";
    };
    "element selected.active" = {
      background-image = mkLiteral "linear-gradient(to right, #EA5553, #EAACAB)";
      text-color = mkLiteral "black";
    };
    "button selected" = {
      background-image = mkLiteral "linear-gradient(to right, #44A2F0, #BDDDF8)";
      text-color = mkLiteral "black";
    };
    "element-icon" = {
      background-color = mkLiteral "transparent";
      size = mkLiteral "48px";
      cursor = mkLiteral "inherit";
    };
    "button" = {
      font = mkLiteral "inherit";
      padding = mkLiteral "10px";
      border-radius = mkLiteral "100%";
      background-image = mkLiteral "linear-gradient(to right, #C03FF2, #EEC2FF)";
      text-color = mkLiteral "white";
      cursor = mkLiteral "pointer";
    };
  };
  modes = [
    "drun"
    "filebrowser"
    "ssh"
  ];
}
