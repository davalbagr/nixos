{pkgs, ...}:
let
  yaziFlavors = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "flavors";
    rev = "9276ffacbfffe1f2d0fa9df9efef07f36896c353";
    hash = "sha256-1IgX6R+0lPVl0r9WcyNkrvFzG6VaWgMklyOUHrxZ4Zg=";
  };
in
{
  enable = true;
  enableBashIntegration = true;
  settings = {
    mgr = {
      show_hidden = true;
    };
  };
  flavors = {
    catppuccin-mocha = "${yaziFlavors}/catppuccin-mocha.yazi/";
  };
  theme = {
    flavor = {
      dark = "catppuccin-mocha";
      light = "catppuccin-mocha";
    };
  };
}
