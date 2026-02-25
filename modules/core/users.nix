{ config, pkgs, ... }:

{
  users.users.tillo = {
    isNormalUser = true;
    description = "tillo";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
    shell = pkgs.zsh;
  };
}
