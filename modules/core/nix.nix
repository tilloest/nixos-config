{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;

  nixpkgs.config.allowUnfree = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  programs.nh = {
    enable = true;
    flake = "/etc/nixos";
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      qt6.qtbase
      qt6.qtdeclarative
      qt6.qttools
      libGLX
    ];
  };
}
