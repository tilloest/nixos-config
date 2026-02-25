{ config, pkgs, inputs, ... }:

{
    programs.zsh = {
        enable = true;

        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        oh-my-zsh = {
        enable = true;
        plugins = [ "git" "sudo" "fzf" "zoxide" ];
        };

        shellAliases = {
        ll = "ls -lah";
        ".." = "cd ..";
        "..." = "cd ../..";
        update = "nh os switch";
        cleanup = "nh clean all";
        };

        history.size = 10000;
    };

    programs.starship = {
        enable = true;

        settings = {
        add_newline = true;
        character = {
            success_symbol = "[❯](bold green)";
            error_symbol   = "[❯](bold red)";
        };
        directory = {
            truncation_length = 4;
            truncate_to_repo  = true;
            };
        };
    };

    programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
    };

    programs.fzf.enable = true;

    programs.zoxide = {
        enable = true;
        enableZshIntegration = true;
    };
}
