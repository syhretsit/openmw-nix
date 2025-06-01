{
  openmw-nix,
  lib,
  stdenv,
  fetchFromGitLab,
  python3,
  makeWrapper,
}:

stdenv.mkDerivation rec {
  pname = "groundcoverify";
  version = "0.2.4-unstable-2025-05-31";

  src = fetchFromGitLab {
    owner = "bmwinger";
    repo = "groundcoverify";
    rev = "3e67c258f5d6991684c598b6afd063721be2fd9d";
    hash = "sha256-9uJ/zxx+2nf+adOi+5Pa/DthTXMwYUpF6u1aDjhdZH8=";
  };

  nativeBuildInputs = [ makeWrapper ];

  installPhase = # bash
    ''
      mkdir -p $out/bin

      install -m +x $src/${pname}.py $out/bin/${pname}

      wrapProgram $out/bin/${pname} \
        --prefix PATH : ${
          lib.makeBinPath [
            openmw-nix.delta-plugin
            python3
          ]
        }
    '';

  meta = {
    description = "";
    homepage = "https://gitlab.com/bmwinger/groundcoverify";
    changelog = "https://gitlab.com/bmwinger/groundcoverify/-/blob/${src.rev}/CHANGELOG.md";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ PopeRigby ];
    mainProgram = "groundcoverify";
    platforms = lib.platforms.all;
  };
}
