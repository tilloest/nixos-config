{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    config = {
      user = {
        name = "tilloest";
        email = "178488902+tilloest@users.noreply.github.com";
      };

      init.defaultBranch = "main";
    };
  };
}
