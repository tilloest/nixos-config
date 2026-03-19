{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    onlyoffice-desktopeditors
    tealdeer
    wget
    git
    mangohud
    floorp-bin
    fastfetch
    discord
    easyeffects
    lsp-plugins
    unrar
    unzip
    ghostty
    winetricks
    protontricks
    qalculate-qt
    protonplus
    pinta
    parabolic
    inkscape
    input-remapper
    localsend
    heroic
    czkawka
    vulkan-tools
    vulkan-loader
    vulkan-headers
  ];
}
