{
  fetchFromGitHub,
  lib,
  rustPlatform,
  ...
}:
rustPlatform.buildRustPackage rec {
  pname = "vfstool";
  version = "0.9.0";

  src = fetchFromGitHub {
    owner = "DreamWeave-MP";
    repo = pname;
    rev = version;
    hash = "sha256-Lv3JWauQ4VEvJKMR82+Z3sL3JZ7nbsB5wIyZTpM7pOY=";
  };

  cargoHash = "sha256-MHIl7McHNDJDwIX3/OWlpYgHiFTFM+m+/JK7FsDu3o0=";

  meta = {
    description = "Utility for interacting with OpenMW's virtual file system";
    homepage = "https://github.com/DreamWeave-MP/vfstool";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ liassica ];
    mainProgram = "vfstool";
  };
}
