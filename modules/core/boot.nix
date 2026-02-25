{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernel.sysctl."vm.max_map_count" = 2147483642;
  boot.kernelParams = [
    "amdgpu.backlight=0"
    "acpi_backlight=vendor"
  ];
}
