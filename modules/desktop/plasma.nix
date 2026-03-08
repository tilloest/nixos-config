{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.xserver.xkb = {
    layout = "us,lt";
    variant = ",";
    options = "grp:alt_shift_toggle";
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
  ];
}
