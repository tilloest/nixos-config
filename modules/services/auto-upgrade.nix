{ config, pkgs, ... }:

{
  system.autoUpgrade = {
    enable = true;
    flake = "/etc/nixos";
    flags = [ "--update-input" "nixpkgs" "--commit-lock-file" ];
    dates = "04:00";
    randomizedDelaySec = "30min";
  };
}
