{
  pkgs,
  ...
}:

pkgs.buildGoModule rec {
  pname = "openmw-validator";
  version = "1.14";

  src = pkgs.fetchFromGitLab {
    owner = "modding-openmw";
    repo = pname;
    rev = version;
    hash = "sha256-uA6BZfbOIFg3mLQaTAQ7tx6J0L9x2CeTJwxZWWO/PIg=";
  };

  doCheck = false;

  vendorHash = "sha256-x4n07zJj8M8mraMNMbtGwe/EBzzGVTcK7mrfi9KFips=";
}
