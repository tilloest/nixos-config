{ config, pkgs, inputs, ... }:

{
    programs.git = {
        enable = true;
        userName = "tilloest";
        userEmail = "178488902+tilloest@users.noreply.github.com";
        extraConfig.init.defaultBranch = "main";
    };
}
