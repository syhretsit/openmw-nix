{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "s3lightfixes";
  version = "0.3.3";

  src = fetchFromGitHub {
    owner = "magicaldave";
    repo = "S3LightFixes";
    rev = "c04e09868b2ffb0ce9f7efc6f306d630cf1e1537";
    hash = "sha256-C8LicGZQGdIzrihAwRwYJNCp73J+XXcyMtde3TgU9Sc=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
    allowBuiltinFetchGit = true;
  };
  cargoHash = "";

  meta = {
    homepage = "https://github.com/magicaldave/S3LightFixes";
    license = lib.licenses.mit;
    description = "Make ESP files which adjust the lighting values from all mods listed in one's openmw.cfg.";
    mainProgram = "s3lightfixes";
    maintainers = [ ];
  };
}
