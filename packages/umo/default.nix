{ python3Packages, fetchFromGitLab, lib, pkgs }:
python3Packages.buildPythonApplication rec {
  pname = "umo";
  version = "0.8.5";

  src = fetchFromGitLab {
    owner = "modding-openmw";
    repo = "umo";
    rev = version;
    sha256 = "sha256-tktk5wey+dVYCx2xrp7oYlvBIyvjSe2hcZ/H4qAH858=";
  };

  patches = [ ./shebang.patch ]; # have to add shebang ourselves, so that nix wrapping magic does the trick
  pyproject = false; #this project has only requirements.txt

  dependencies = with python3Packages; [
    coloredlogs
    desktop-notifier
    pkgs.openmw-nix.curldl
    pkgs.desktop-file-utils
    pycurl
    pydantic
    pycryptodomex
    platformdirs
    rarfile
    pwinput
    websockets
    certifi
  ];

  # This package has a Makefile which is used to compile! python code with nuitka compiler.
  # IMO, it's an overkill for a small utility, and it makes stuff harder to package. 
  # Instead we use pure python, and just have to override 2 phases that uses Makefile by default.
  buildPhase = ''
    mkdir -p $out/usr/share/icons $out/bin

    cp -r src/* $out/bin
    cp icons/KeenderM.png $out/usr/share/icons

  '';

  installPhase = ''
    install -D -m +rx $out/bin/umo.py $out/bin/umo
  '';

  checkPhase = ''
    $out/bin/umo --help
  '';

  meta = {
    description = "umo is an automatic modlist downloader for Modding-OpenMW.com";
    homepage = "https://gitlab.com/modding-openmw/umo";
    license = lib.licenses.agpl3Only;
    mainProgram = "umo";
  };
}
