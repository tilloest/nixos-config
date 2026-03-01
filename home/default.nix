{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.plasma-manager.homeModules.plasma-manager

    ./shell.nix
    ./git.nix
    ./vscode.nix
    ./packages.nix
    ./plasma.nix
  ];

  home.username = "tillo";
  home.homeDirectory = "/home/tillo";
  home.stateVersion = "25.11";
}
