{
  lib,
  pkgs,
  tweakedWaterShader ? true,
  ...
}:

pkgs.openmw.overrideAttrs (old: {
  pname = "openmw";
  version = "openmw-0.49.0-unstable-2025-10-04";

  src = pkgs.fetchFromGitLab {
    owner = "OpenMW";
    repo = "openmw";
    rev = "ef05e089abcb7f76bca4601f4acec4f40e438a62";
    hash = "sha256-0vIASx/EkwCzLUXXo2VhOE2k+JPLtJ4A1d3bdUXT4rI=";
  };

  # Tweaks core water shader to work with Wareya's SSR post processing water shader
  # https://github.com/wareya/OpenMW-Shaders?tab=readme-ov-file#using-the-water-shader
  patches = lib.optionals tweakedWaterShader [ ./tweaked_water_shader.patch ];
})
