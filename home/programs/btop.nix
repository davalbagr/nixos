{pkgs, ...}: {
  # enable = pkgs.stdenv.isLinux;
  enable = false;
  package = pkgs.btop.override {
    rocmSupport = pkgs.stdenv.system == "x86_64-linux";
    cudaSupport = true;
  };
  settings = {
    vim_keys = true;
    rounded_corners = true;
    show_coretemp = true;
    cpu_sensor = "auto";
    show_disks = true;
    io_mode = true;
    io_graph_combined = false;
  };
}
