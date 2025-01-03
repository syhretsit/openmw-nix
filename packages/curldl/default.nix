{ fetchFromGitHub, python3Packages, lib }:
python3Packages.buildPythonPackage rec {
  pname = "curldl";
  version = "1.0.1";

  src = fetchFromGitHub {
    owner = "noexec";
    repo = "curldl";
    rev = "v${version}";
    sha256 = "sha256-Dofbgirl0eC3Luw7XXdQPIAnfpGath9cM7ATzaFumEQ=";
  };

  pyproject = true;
  dependencies = with python3Packages; [ pycurl tenacity tqdm ];
  nativeBuildInputs = with python3Packages; [ setuptools setuptools-scm ];

  meta = {
    description = "Safely and reliably download files with PycURL";
    homepage = "https://github.com/noexec/curldl";
    license = lib.licenses.lgpl3;
  };
}
