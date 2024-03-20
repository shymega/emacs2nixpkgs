{ lib
, pkgs ? import <nixpkgs>
, rustPlatform
,
}:
rustPlatform.buildRustPackage {
  name = "emacsconf2nix";

  src = lib.cleanSource ./.;

  cargoLock = {
    lockFile = ./Cargo.lock;
    allowBuiltinFetchGit = true;
  };

  nativeBuildInputs = [ ];
  buildInputs = [ ];

  meta = with lib; {
    description = "Emacs configuration parser, integrated with Nix.";
    homepage = "https://github.com/shymega/emacsconf2nix";
    license = licenses.mit;
  };
}
