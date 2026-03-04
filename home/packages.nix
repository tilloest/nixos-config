{ config, pkgs, inputs, ... }:

{
    home.packages = with pkgs; [
        obsidian
    ];

    programs.localsend.enable = true;
}
