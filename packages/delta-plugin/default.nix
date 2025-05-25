{
  fetchFromGitLab,
  lib,
  rustPlatform,
  ...
}:

rustPlatform.buildRustPackage rec {
  pname = "delta-plugin";
  version = "0.23.0";

  src = fetchFromGitLab {
    owner = "bmwinger";
    repo = pname;
    rev = version;
    hash = "sha256-DAgir+2T1vz9MmXsb20H2XgTxviOi3ZH0vNo53FfGUQ=";
  };

  cargoHash = "sha256-CW3JJoaxuKHJscUdaAhZTKOxGKjp5w51h7/qxlAYWaQ=";

  meta = {
    description = "A tool for handling and converting markup-based versions of ESP files.";
    homepage = "https://gitlab.com/bmwinger/delta-plugin";
    license = lib.licenses.gpl3;
    mainProgram = "delta_plugin";
  };
}
