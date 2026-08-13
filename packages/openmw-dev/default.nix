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
    rev = "b34418332f85fd52c9cf5ff276f095fe658ea93d";
    hash = "sha256-g2VwFb+5o032h1W3MvsZLmenSVpgYjTqo7wczq+lCUQ=";
  };

  # Tweaks core water shader to work with Wareya's SSR post processing water shader
  # https://github.com/wareya/OpenMW-Shaders?tab=readme-ov-file#using-the-water-shader
  # patches = lib.optionals tweakedWaterShader [ ./tweaked_water_shader.patch ]; # temporarly disabled
})
