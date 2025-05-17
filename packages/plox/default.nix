{
  fetchFromGitHub,
  lib,
  pkgs,
  rustPlatform,
  stdenv,
}:

rustPlatform.buildRustPackage rec {
  pname = "plox";
  version = "0.5.0";

  src = fetchFromGitHub {
    owner = "rfuzzo";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-9JkbeiaMJl1EIqz/YctfJkzcWm+701C/3E8Q/UHml8Y=";
  };

  cargoHash = "sha256-cbMoJM3528guWLw2IPPfEYxRSF5Yg7bJ4nHB5yCjPDo=";

  nativeBuildInputs = [ pkgs.pkg-config ];

  buildInputs =
    (with pkgs; [
      libxkbcommon
      openssl
    ])
    ++ lib.optionals pkgs.stdenv.isDarwin (
      with pkgs.darwin.apple_sdk.frameworks;
      [
        AppKit
        CoreGraphics
        Foundation
        Security
      ]
    )
    ++ lib.optionals stdenv.isLinux [
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
