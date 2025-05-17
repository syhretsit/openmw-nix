{
  fetchFromGitHub,
  inputs,
  lib,
  makeRustPlatform,
  stdenv,
}:

let
  system = stdenv.hostPlatform.system;
  # The Rust nightly toolchain is required
  toolchain = inputs.fenix.packages.${system}.minimal.toolchain;
  rustPlatform = makeRustPlatform {
    cargo = toolchain;
    rustc = toolchain;
  };
in

rustPlatform.buildRustPackage rec {
  pname = "tes3conv";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "Greatness7";
    repo = "tes3conv";
    rev = "v${version}";
    hash = "sha256-fY2+JjqxYzvc9dgqd9Z6fGnQlYyLBvg2s43UvZMTbXc=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "bytes_io-0.0.1" = "sha256-lp5jBIFLt/nKHDezcWP0upSbGNx1DRwCuvTbKPfcRrk=";
    };
  };

  postPatch = ''
    ln -s ${./Cargo.lock} Cargo.lock
  '';

  meta = {
    description = "Convert TES3 plugins (.esp) into JSON files (.json), and vice-versa";
    homepage = "https://github.com/Greatness7/tes3conv";
    license = lib.licenses.unfree;
    maintainers = with lib.maintainers; [ PopeRigby ];
    mainProgram = "tes3conv";
  };
}
