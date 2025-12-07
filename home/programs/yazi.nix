{ pkgs, ... }:
{
  enable = true;
  enableFishIntegration = true;
  flavors.rose-pine = pkgs.fetchFromGitHub {
    owner = "Mintass";
    repo = "rose-pine.yazi";
    rev = "834334048d0bc8c7c344a5a8abce0b0cb35612d3";
    hash = "sha256-eDJ0CsLK0ED0zl3MGfd1JtVcmwDHlkaOnliKltNneOo=";
  };
  settings.flavor = {
    dark = "rose-pine";
    light = "rose-pine";
  };
}
