{pkgs, ...}: {
  enable = pkgs.stdenv.isLinux;
  settings = {
    bell = {
      system = "no";
    };
  };
}
