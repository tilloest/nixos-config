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

    shortcuts = {
      "com.mitchellh.ghostty.desktop" = {
        "_launch" = "Meta+Return";
      };
    };

    session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";

    configFile."kickoffrc" = {
      "General" = {
        "icon" = "nix-snowflake-white";
        "hiddenApplications" = hiddenAppsString;
      };
    };
  };
}
