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
    rev = "8d0f92753a40e2cdd8016d234b2a856e1082a657";
    hash = "sha256-XhHcvdh9fZ5QLIqjEx29eDXK/uh7UZe5g4A35IBGK3o=";
  };

  # Tweaks core water shader to work with Wareya's SSR post processing water shader
  # https://github.com/wareya/OpenMW-Shaders?tab=readme-ov-file#using-the-water-shader
  # patches = lib.optionals tweakedWaterShader [ ./tweaked_water_shader.patch ]; # temporarly disabled
})
