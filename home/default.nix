{ config, pkgs, inputs, ... }:

{
  imports = [
    ./shell.nix
    ./git.nix
    ./vscode.nix
    ./packages.nix
    ./programming.nix
  ];

  home.username = "tillo";
  home.homeDirectory = "/home/tillo";
  home.stateVersion = "25.11";
}
