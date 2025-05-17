{
  fetchFromGitLab,
  lib,
  rustPlatform,
  ...
}:

rustPlatform.buildRustPackage rec {
  pname = "delta-plugin";
  version = "0.22.3";

  src = fetchFromGitLab {
    owner = "bmwinger";
    repo = pname;
    rev = version;
    hash = "sha256-8wotQ+ByOo0y1AM1uym7kVt30q6c5JKy6JKCMDKpV/0=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "esplugin-4.0.0" = "sha256-VQXG40q20VzM9mm4Nt8QHSUW9c7y1Osf2e505ypirZc=";
      "yaml-rust-0.4.3" = "sha256-W9ob53kL6oO7k7MMEudvRVQCAYbcWXwCdNPWyP0Zkpg=";
    };
  };

  meta = {
    description = "A tool for handling and converting markup-based versions of ESP files.";
    homepage = "https://gitlab.com/bmwinger/delta-plugin";
    license = lib.licenses.gpl3;
    mainProgram = "delta_plugin";
  };
}
