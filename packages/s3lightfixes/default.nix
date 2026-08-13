{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "s3lightfixes";
  version = "0.4.58";

  src = fetchFromGitHub {
    owner = "DreamWeave-MP";
    repo = "S3LightFixes";
    tag = finalAttrs.version;
    hash = "sha256-e/CeXOFVAJH7vazlflC68DrwKZQzl8UzklvYLplubbI=";
  };

  cargoHash = "sha256-wjk41yowWpgRLyu84tjDvqqhtjsJvZdaZOYYdP04ZdE=";

  meta = {
    description = "Generates and installs light fixing plugins for OpenMW";
    homepage = "https://github.com/DreamWeave-MP/S3LightFixes";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "s3lightfixes";
  };
})
