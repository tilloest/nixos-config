{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [

    ##################################################
    # Core Build Toolchain (shared dependencies)
    ##################################################

    gcc
    clang
    gnumake
    cmake
    ninja
    pkg-config
    gdb
    lldb

    # Common native deps many projects need
    openssl
    zlib
    libffi

    ##################################################
    # Python Development
    ##################################################

    (python311.withPackages (ps: with ps; [
      pip
      virtualenv
      setuptools
      wheel

      # Linting / Formatting / Typing
      black
      isort
      flake8
      mypy

      # Debugging
      debugpy
    ]))

    ##################################################
    # Rust Development
    ##################################################

    rustc
    cargo
    rustfmt
    clippy

    ##################################################
    # C++ Extra Tooling
    ##################################################

    clang-tools        # clangd, clang-format
    cppcheck           # static analysis

  ];

  ##################################################
  # Environment Variables for Native Builds
  ##################################################

  home.sessionVariables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  };

}
