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
    rev = "ebcdbb152e5a5e2380e5e177bbe25abb344394a9";
    hash = "sha256-96GJDfWszXXwl9Dfc1Ka5V6148EYX0V+acRgkbSO8i0=";
  };

  # Tweaks core water shader to work with Wareya's SSR post processing water shader
  # https://github.com/wareya/OpenMW-Shaders?tab=readme-ov-file#using-the-water-shader
  # patches = lib.optionals tweakedWaterShader [ ./tweaked_water_shader.patch ]; # temporarly disabled
})
