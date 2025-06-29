{
  fetchFromGitLab,
  lib,
  rustPlatform,
  ...
}:

rustPlatform.buildRustPackage rec {
  pname = "delta-plugin";
  version = "0.24.0";

  src = fetchFromGitLab {
    owner = "bmwinger";
    repo = pname;
    rev = version;
    hash = "sha256-bBW1a4rrLGkCbcMKyQMSZN6RB/0Wcc6iB5i6IlVSoGo=";
  };

  cargoHash = "sha256-etB0ngfNTuOGZiZk9/y/8PTSqymsbKdI7EHzUNlrfhs=";

  meta = {
    description = "A tool for handling and converting markup-based versions of ESP files.";
    homepage = "https://gitlab.com/bmwinger/delta-plugin";
    license = lib.licenses.gpl3;
    mainProgram = "delta_plugin";
  };
}
