{
  fetchFromGitLab,
  lib,
  rustPlatform,
  ...
}:

rustPlatform.buildRustPackage rec {
  pname = "delta-plugin";
  version = "0.24.1";

  src = fetchFromGitLab {
    owner = "bmwinger";
    repo = pname;
    rev = version;
    hash = "sha256-tlSgQkq5ZGDlyYmf8AdQAwq1GnVR1egDEClX+xLfzp4=";
  };

  cargoHash = "sha256-A1xO7phoqYDzGmvtfLWb9TApa96hkWj29IQZT45BN7o=";

  meta = {
    description = "A tool for handling and converting markup-based versions of ESP files.";
    homepage = "https://gitlab.com/bmwinger/delta-plugin";
    license = lib.licenses.gpl3;
    mainProgram = "delta_plugin";
  };
}
