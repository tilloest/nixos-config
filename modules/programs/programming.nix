{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [

    ##################################################
    # Core Toolchain
    ##################################################

    clang
    clang-tools
    gnumake
    cmake
    ninja
    pkg-config
    gdb
    lldb
    cppcheck

    ##################################################
    # Native Libraries
    ##################################################

    openssl
    zlib
    libffi

    ##################################################
    # Python
    ##################################################

    (python3.withPackages (ps: with ps; [
      pip          # Package installer
      virtualenv   # To create isolated environments
      setuptools   # Standard build tool
      black        # Opinionated formatter
      flake8       # Linter
      mypy         # Static type checker
      ipython      # Better interactive shell
    ]))

    ##################################################
    # Rust
    ##################################################

    rustc
    cargo
    rustfmt
    clippy
  ];

  environment.variables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  };
}
