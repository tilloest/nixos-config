{ config, pkgs, ... }:

{
  networking.hostName = "sofia";
  networking.networkmanager.enable = true;
}
