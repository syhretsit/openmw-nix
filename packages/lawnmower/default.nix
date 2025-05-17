{
  fetchFromGitHub,
  lib,
  makeWrapper,
  openmw-nix,
  python3,
  stdenv,
}:

stdenv.mkDerivation {
  pname = "lawnmower";
  version = "1.6";

  src = fetchFromGitHub {
    owner = "PopeRigby";
    repo = "lawnmower";
    rev = "bef67daaaf389311cc26c33d06084bf509962503";
    hash = "sha256-KfCqrCa86u6SZfa3JnjrEynxCkeZMFYU3DgRtlB7ggM=";
  };

  nativeBuildInputs = [ makeWrapper ];

  installPhase = # bash
    ''
      mkdir -p $out/bin

      for name in grassclipper lawnmower massmower weedwhacker; do
        {
          printf '#!${python3.interpreter}\n'
          cat "$src/$name.py"
        } > $out/bin/$name

        chmod +x $out/bin/$name

        wrapProgram $out/bin/$name \
          --prefix PATH : ${lib.makeBinPath [ openmw-nix.tes3conv ]}
      done
    '';

  meta = {
    description = "Automated grass cleaning tool for Morrowind";
    homepage = "https://github.com/acidzebra/lawnmower";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ PopeRigby ];
    mainProgram = "lawnmower";
    platforms = lib.platforms.all;
  };
}
