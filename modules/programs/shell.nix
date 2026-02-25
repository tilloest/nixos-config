{ config, pkgs, ... }:

{
  programs.zsh.enable = true;
  programs.starship.enable = true;
  programs.fzf.enable = true;
  programs.zoxide.enable = true;
}
