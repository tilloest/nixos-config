{ config, pkgs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.tillo = import ./home.nix;
  };
}
