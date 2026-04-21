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
    rev = "6af8cdf6228415ca728e7c45648c5bba27da1190"
    hash = "";
  };

  # Tweaks core water shader to work with Wareya's SSR post processing water shader
  # https://github.com/wareya/OpenMW-Shaders?tab=readme-ov-file#using-the-water-shader
  # patches = lib.optionals tweakedWaterShader [ ./tweaked_water_shader.patch ]; # temporarly disabled
})
