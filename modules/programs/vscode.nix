{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;

    extensions = with pkgs.vscode-extensions; [
        # --- General Essentials ---
        jnoortheen.nix-ide          # Nix language support (must-have for you!)
        mkhl.direnv                 # Integration for nix-shell/direnv
        christian-kohler.path-intellisense
        eamodio.gitlens             # Supercharged git blame/history
        usernamehw.errorlens        # Highlights errors directly on the line
        esbenp.prettier-vscode      # Opinionated formatter

        # --- Python ---
        ms-python.python
        ms-python.vscode-pylance
        ms-python.debugpy

        # --- Rust ---
        rust-lang.rust-analyzer
        tamasfe.even-better-toml    # Crucial for Cargo.toml files
        vadimcn.vscode-lldb         # Better debugging for Rust/C++

        # --- C++ ---
        ms-vscode.cpptools          # Standard C/C++ IntelliSense & Debugging
        ms-vscode.cmake-tools       # If your school uses CMake
        twxe.cmake                  # CMake language support

        # --- Themes ---
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
    ];
  };
}
