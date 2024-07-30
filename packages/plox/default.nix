{
    fetchFromGitHub,
    pkgs,
    rustPlatform,
    ...
}:

rustPlatform.buildRustPackage rec {
    pname = "plox";
    version = "0.4.1";

    src = fetchFromGitHub {
        owner = "rfuzzo";
        repo = pname;
        rev = "v${version}";
        hash = "sha256-XUOD6yzpkNIZHHv1GiGJdPFV2ehiwva+1tzMvPXprk4=";
    };

    cargoHash = "sha256-SrTvMLnrSZK38nmX3OhL3HwfUXzh8RvtNEaOnaxDG9c=";

    buildInputs = [ pkgs.openssl ];
    nativeBuildInputs = [ pkgs.pkg-config ];

    meta = {
        description = "A small app to sort a mod list topologically according to ordering rules, as well as output warnings and notes.";
        homepage = "https://github.com/rfuzzo/plox";
        mainProgram = "plox";
    };
}
