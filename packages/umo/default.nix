{
  python3Packages,
  fetchFromGitLab,
  lib,
  pkgs,
}:
python3Packages.buildPythonApplication rec {
  pname = "umo";
  version = "0.11";

  src = fetchFromGitLab {
    owner = "modding-openmw";
    repo = "umo";
    rev = version;
    sha256 = "sha256-gb/mC+AksOyoWnpm0LIcTwSw6bXT2UnaU2XMIo4VtMA=";
  };

  pyproject = true;

  build-system = with python3Packages; [
    setuptools
  ];
  dependencies = with python3Packages; [
    beautifulsoup4
    certifi
    click
    coloredlogs
    desktop-notifier
    pkgs.desktop-file-utils
    pkgs.openmw-nix.curldl
    platformdirs
    pwinput
    pycryptodomex
    pycurl
    pydantic
    rarfile
    toml
    typer
    websockets
    pkgs.tes3cmd
    pkgs.p7zip-rar
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

  postPatch = ''
    sed -i 's|license = {text = "GNU AGPLv3"}|license = "AGPLv3"|' pyproject.toml
    # sed -i '/license = "GNU AGPLv3"/a license-files = [ "LICENSE", ]' pyproject.toml
    # sed -i '/license = {text = "GNU AGPLv3"}/a license-files = [ "LICENSE", ]' pyproject.toml
  '';

  meta = {
    description = "umo is an automatic modlist downloader for Modding-OpenMW.com";
    homepage = "https://gitlab.com/modding-openmw/umo";
    license = lib.licenses.agpl3Only;
    mainProgram = "umo";
  };
}
