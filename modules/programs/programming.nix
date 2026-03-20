{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    clang
    clang-tools
    gnumake
    cmake
    ninja
    pkg-config
    gdb
    lldb
    cppcheck

    openssl
    zlib
    libffi


    (python3.withPackages (ps: with ps; [
      pip          # Package installer
      virtualenv   # To create isolated environments
      setuptools   # Standard build tool
      black        # Opinionated formatter
      flake8       # Linter
      mypy         # Static type checker
      ipython      # Better interactive shell
    ]))

    rustc
    cargo
    rustfmt
    clippy

    helix
  ];

  environment.variables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  };
}
