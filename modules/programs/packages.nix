{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    git
    unrar
    unzip
    easyeffects
    lsp-plugins
    mangohud
    winetricks
    protontricks
    protonplus
    vulkan-tools
    vulkan-loader
    vulkan-headers
    lsfg-vk
    lsfg-vk-ui
    ghostty
    input-remapper
  ];
}
