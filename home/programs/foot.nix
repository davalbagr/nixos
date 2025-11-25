{pkgs, ...}: {
  enable = pkgs.stdenv.isLinux;
  server.enable = true;
  settings = {
    bell = {
      system = "no";
    };
  };
}
