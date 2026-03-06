{ pkgs, lib, ... }:

let
  lspDesktopFiles = builtins.attrNames (builtins.readDir "${pkgs.lsp-plugins}/share/applications");

  lspHiddenList = builtins.filter (name: lib.hasPrefix "lsp-plugins" name) lspDesktopFiles;

  hiddenAppsString = lib.concatStringsSep "," lspHiddenList;
in
{
  programs.plasma = {
    enable = true;

    workspace = {
      clickItemTo = "select";
      lookAndFeel = "org.kde.breezedark.desktop";
      cursor = {
        theme = "Bibata-Modern-Classic";
      };
    };

    session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";

    file."kickoffrc" = {
      "General" = {
        "hiddenApplications" = hiddenAppsString;
      };
    };
  };
}
