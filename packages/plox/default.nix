{
    fetchFromGitHub,
    lib,
    pkgs,
    rustPlatform,
    stdenv,
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

    nativeBuildInputs = [ pkgs.pkg-config ];

    buildInputs = (with pkgs; [
        libxkbcommon
        openssl
    ]) ++ lib.optionals pkgs.stdenv.isDarwin (with pkgs.darwin.apple_sdk.frameworks; [
        AppKit
        CoreGraphics
        Foundation
        Security
    ]) ++ lib.optionals stdenv.isLinux [
        pkgs.wayland
    ];

    meta = {
        description = "A small app to sort a modlist topologically according to ordering rules, as well as output warnings and notes";
        homepage = "https://github.com/rfuzzo/plox";
        changelog = "https://github.com/rfuzzo/plox/blob/${src.rev}/CHANGELOG.md";
        license = lib.licenses.mit;
        mainProgram = "plox";
    };
}
