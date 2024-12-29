{
  pkgs,
}:

pkgs.python3Packages.buildPythonApplication rec {
  pname = "groundcoverify";
  version = "0.2.1";

  pyproject = true;

  src = pkgs.fetchFromGitLab {
    owner = "PopeRigby";
    repo = pname;
    rev = "c70db3c3f6361f9c57faf57ca062f3df6136a3ac";
    sha256 = "sha256-+tNaE3bzyGlTDbPhdhiJk8jJ8FUWJSCL+oF5G+Ud4Kg=";
  };

  # External compiled dependencies
  buildInputs = [ pkgs.custom.delta-plugin ];

  # Python dependencies
  dependencies = [ pkgs.python3Packages.setuptools ];

  meta.mainProgram = pname;
}
