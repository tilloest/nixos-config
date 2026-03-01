{ inputs, pkgs, lib, ... }:

let
  lspDesktopFiles = builtins.attrNames (builtins.readDir "${pkgs.lsp-plugins}/share/applications");

  lspHiddenList = builtins.filter (name: lib.hasPrefix "lsp-plugins" name) lspDesktopFiles;
in
{
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
  ];

  programs.plasma = {
    enable = true;

    workspace = {
      clickItemTo = "select";
      lookAndFeel = "org.kde.breeze.desktop";
    };
  kickoff.hiddenApplications = lspHiddenList;
  };
}
