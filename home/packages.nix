{ config, pkgs, inputs, ... }:

{
    home.packages = with pkgs; [
        obsidian
        bibata-cursors
        onlyoffice-desktopeditors
        floorp-bin
        discord
        qalculate-qt
        pinta
        parabolic
        inkscape
        localsend
        heroic
        czkawka
        tealdeer
        fastfetch
    ];
}
