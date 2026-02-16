{
  lib,
  pkgs,
  tweakedWaterShader ? true,
  ...
}:

pkgs.openmw.overrideAttrs (old: {
  pname = "openmw";
  version = "master";

  src = pkgs.fetchFromGitLab {
    owner = "OpenMW";
    repo = "openmw";
    rev = "a13f8f33942756403f81cfe1a9c170ad5af4134d";
    hash = "";
  };

  # Tweaks core water shader to work with Wareya's SSR post processing water shader
  # https://github.com/wareya/OpenMW-Shaders?tab=readme-ov-file#using-the-water-shader
  patches = lib.optionals tweakedWaterShader [ ./tweaked_water_shader.patch ];
})
