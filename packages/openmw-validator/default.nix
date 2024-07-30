{
    pkgs,
    ...
}:

pkgs.buildGoModule rec {
    pname = "openmw-validator";
    version = "1.10";

    src = pkgs.fetchFromGitLab {
        owner = "modding-openmw";
        repo = pname;
        rev = version;
        hash = "sha256-x59Wz8kzitYuCLIDh83B5WW4qCRvmR61eN9SFftH6bQ=";
    };

    doCheck = false;

    vendorHash = "sha256-v95YjYXE0X3WFJGP4bP6lT/j7b8FqXSJkN8jxUM5eMU=";
}
