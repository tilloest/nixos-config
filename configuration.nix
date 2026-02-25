{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    # Core
    ./modules/core/boot.nix
    ./modules/core/networking.nix
    ./modules/core/locale.nix
    ./modules/core/nix.nix
    ./modules/core/users.nix

    # Hardware
    ./modules/hardware/nvidia.nix
    ./modules/hardware/power.nix

    # Desktop
    ./modules/desktop/plasma.nix
    ./modules/desktop/audio.nix
    ./modules/desktop/input.nix
    ./modules/desktop/fonts.nix
    ./modules/desktop/printing.nix

    # Programs
    ./modules/programs/packages.nix
    ./modules/programs/gaming.nix
    ./modules/programs/vscode.nix
    ./modules/programs/git.nix
    ./modules/programs/shell.nix
    ./modules/programs/spicetify.nix

    # Services
    ./modules/services/flatpak.nix
    ./modules/services/fwupd.nix
    ./modules/services/auto-upgrade.nix
  ];

  system.stateVersion = "25.11";
}
