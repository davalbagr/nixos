# https://wiki.nixos.org/wiki/Intel_Graphics
{pkgs, ...}: {
  services.xserver.videoDrivers = ["modesetting"];
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      vpl-gpu-rt
    ];
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };

  hardware.enableRedistributableFirmware = true;
  boot.kernelParams = ["i915.enable_guc=3"];
}
