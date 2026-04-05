{ config, pkgs, inputs, ... }:

{
    programs.virt-manager.enable = true;
    users.groups.libvirtd.members = ["tillo"];
    users.users.tillo.extraGroups = [ "libvirtd" ];
    virtualisation.libvirtd.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;
}
