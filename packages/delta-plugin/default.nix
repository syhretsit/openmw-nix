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

  cargoHash = "sha256-dOZJsgtJYSr2QjQLBLao0JF7mniir9QRAxl3E5p6P6E=";

  meta = {
    description = "A tool for handling and converting markup-based versions of ESP files.";
    homepage = "https://gitlab.com/bmwinger/delta-plugin";
    license = lib.licenses.gpl3;
    mainProgram = "delta_plugin";
  };
}
