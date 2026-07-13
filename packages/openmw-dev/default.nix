{
  lib,
  pkgs,
  # tweakedWaterShader ? true,
  ...
}:

pkgs.openmw.overrideAttrs (old: {
  pname = "openmw";
  version = "master";

  src = pkgs.fetchFromGitLab {
    owner = "OpenMW";
    repo = "openmw";
    rev = "6b5f6aa5f1fba4be436bb9816043c53398e5a4ff";
    hash = "sha256-NHMQcKaE/HUktaqjdgC004h698SYJYz4bPkxD7hg56c=";
  };

  # Tweaks core water shader to work with Wareya's SSR post processing water shader
  # https://github.com/wareya/OpenMW-Shaders?tab=readme-ov-file#using-the-water-shader
  # patches = lib.optionals tweakedWaterShader [ ./tweaked_water_shader.patch ]; # temporarly disabled
})
