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
  version = "0.2.1";

  # src = fetchFromGitLab {
  #   owner = "bmwinger";
  #   repo = "groundcoverify";
  #   rev = version;
  #   hash = "sha256-mu/ZHoB+mnsuzk8TOJHbZSfowMPfg2c550OiSuWfb4Q=";
  # };
  src = fetchFromGitLab {
    owner = "PopeRigby";
    repo = "groundcoverify";
    rev = "f3414eb0d33accd21005007bb500306366850805";
    hash = "sha256-OXi5zxFa7QOAmhqS2dcfs2ROaw7KQH2DzkLZ/BBfd/w=";
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
