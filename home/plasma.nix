{ pkgs, lib, ... }:

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

    input.keyboard = {
      numlockOnStartup = "on";
    };

    shortcuts = {
      "com.mitchellh.ghostty.desktop" = {
        "_launch" = "Meta+Return";
      };
    };

    krunner = {
      position = "center";
    };

    session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
  };
}
