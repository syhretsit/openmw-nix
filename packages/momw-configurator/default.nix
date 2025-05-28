{
  lib,
  buildGoModule,
  fetchFromGitLab,
}:

buildGoModule {
  pname = "momw-configurator";
  version = "1.19";

  src = fetchFromGitLab {
    owner = "modding-openmw";
    repo = "momw-configurator";
    rev = "0f66c3bb2e491e1905a0f91dfe9a16e782ecf4d9";
    hash = "sha256-ESaX3Zt4BempzsuPf0fttqj4aUNP/oJpSZyqWF0yPz0=";
  };

  vendorHash = "sha256-Pu16/2qZvAkLVb1D3uQt3XrcfBn9lBGY5UVjAGsLKag=";

  meta = {
    homepage = "https://gitlab.com/modding-openmw/momw-configurator";
    license = lib.licenses.mit;
    description = "Generates fully functional openmw.cfg and settings.cfg files for any mod list from Modding-OpenMW.com.";
    mainProgram = "momw-configurator";
    maintainers = [ ];
  };
}
