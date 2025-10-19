{
  fetchFromGitLab,
  lib,
  rustPlatform,
  ...
}:

rustPlatform.buildRustPackage rec {
  pname = "delta-plugin";
  version = "0.25.1";

  src = fetchFromGitLab {
    owner = "bmwinger";
    repo = pname;
    rev = version;
    hash = "sha256-pKDbMvY+PdG8+J2vKB/mwy2A7TlTrACUlIs3/x8M9tI=";
  };

  cargoHash = "sha256-od/BGJ5NDgFqAAxfpKh4EWwaVYh9YsPelu9x6GdxIWE=";

  meta = {
    description = "A tool for handling and converting markup-based versions of ESP files.";
    homepage = "https://gitlab.com/bmwinger/delta-plugin";
    license = lib.licenses.gpl3;
    mainProgram = "delta_plugin";
  };
}
