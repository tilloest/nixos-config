{ config, pkgs, ... }:

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

    (python312.withPackages (ps: with ps; [
      pip
      virtualenv
      setuptools
      wheel
      black
      isort
      flake8
      mypy
      debugpy
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
