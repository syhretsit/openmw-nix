{
  fetchFromGitLab,
  lib,
  rustPlatform,
  ...
}:

rustPlatform.buildRustPackage rec {
  pname = "delta-plugin";
  version = "0.25.3";

  src = fetchFromGitLab {
    owner = "bmwinger";
    repo = pname;
    rev = version;
    hash = "sha256-zi/qObNrQCPr2bE5a4D8QnJs/szTpnWLmvzqRs0GbZc=";
  };

  cargoHash = "sha256-M6yy35Mvr4tW8sDIjyRECLInMJymOEYIdiAG96aDVRI=";

  meta = {
    description = "A tool for handling and converting markup-based versions of ESP files.";
    homepage = "https://gitlab.com/bmwinger/delta-plugin";
    license = lib.licenses.gpl3;
    mainProgram = "delta_plugin";
  };
}
