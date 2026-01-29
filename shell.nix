# Nix is a powerful package manager for Linux and other Unix systems that makes
# package management reliable and reproducible: https://nixos.org/nix/.
# This file is intended to be used with `nix-shell`
# (https://nixos.org/nix/manual/#sec-nix-shell) to setup a fully-functional
# syncstorage-rs build environment by installing all required dependencies.
with import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/dc402c1fc646b5aeb6e50bdd06e1509981ce2af0.tar.gz") {};
stdenv.mkDerivation {
  name = "syncstorage-rs";
  buildInputs = [
    rustc
    cargo
    libmysqlclient
    pkg-config
    openssl
    cmake
    protobuf
    python313
    go
  ];
  NIX_LDFLAGS = "-L${libmysqlclient}/lib/mysql";
  RUST_SRC_PATH = "${rustPlatform.rustLibSrc}";
}
