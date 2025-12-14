{ pkgs, ... }:
let
  rosePineTheme = pkgs.fetchFromGitHub {
    owner = "rose-pine";
    repo = "yazi";
    rev = "fd385266af5f3419657e449607f3e87f062d0d2e";
    hash = "sha256-3j7TTtzG+GCB4uVeCiuvb/0dCkHPz7X+MDBVVUp646A=";
  };

in
{
  enable = true;
  enableBashIntegration = true;
  flavors.rose-pine = "${rosePineTheme}/flavors/rose-pine.yazi";
  settings = {
    mgr = {
      show_hidden = true;
    };
  };
  theme = builtins.fromTOML (builtins.readFile "${rosePineTheme}/themes/rose-pine.toml") // {
    flavor = {
      dark = "rose-pine";
      light = "rose-pine";
    };
  };
}
