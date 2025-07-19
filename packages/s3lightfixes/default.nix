{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "s3lightfixes";
  version = "0.4.4";

  src = fetchFromGitHub {
    owner = "magicaldave";
    repo = "S3LightFixes";
    rev = "c04e09868b2ffb0ce9f7efc6f306d630cf1e1537";
    hash = "sha256-C8LicGZQGdIzrihAwRwYJNCp73J+XXcyMtde3TgU9Sc=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "bytes_io-0.0.1" = "sha256-SG47djSAxzSfxGsVnioRyYvaZtsFVR/zInADxsuXz+k=";
      "openmw-cfg-0.5.2" = "sha256-kQBGA0mI8tnJ647G5yeC7xw1TEAFg/wY+R5HePB3BKw=";
    };
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
