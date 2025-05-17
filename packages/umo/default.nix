{ python3Packages, fetchFromGitLab, lib, pkgs }:
python3Packages.buildPythonApplication rec {
  pname = "umo";
  version = "0.9.4";

  src = fetchFromGitLab {
    owner = "modding-openmw";
    repo = "umo";
    rev = version;
    sha256 = "sha256-lEkYSK07sAC9miXMJkaxXoBfW5+X/ztp5pT7o4Wo2lQ=";
  };

  pyproject = true;

  build-system = with python3Packages; [
    setuptools
  ];
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
    beautifulsoup4
  ];

  pythonRelaxDeps = true;

  nativeInstallCheckInputs = [ pkgs.versionCheckHook ];
  versionCheckProgramArg = "--version";
  doInstallCheck = true;
  installCheckPhase = ''
    # have to import hook manually, something is broken for automatic import
    source ${pkgs.versionCheckHook}/nix-support/setup-hook
    versionCheckHook
  '';

  meta = {
    description = "umo is an automatic modlist downloader for Modding-OpenMW.com";
    homepage = "https://gitlab.com/modding-openmw/umo";
    license = lib.licenses.agpl3Only;
    mainProgram = "umo";
  };
}
