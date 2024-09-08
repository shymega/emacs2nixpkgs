{ lib
, pkgs ? import <nixpkgs>
, rustPlatform
,
}:
rustPlatform.buildRustPackage {
  name = "emacs2nixpkg";

  src = lib.cleanSource ./.;

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  nativeBuildInputs = [ ];
  buildInputs = [ ];

  meta = with lib; {
    description = "Emacs configuration parser, for use with Nix.";
    homepage = "https://github.com/shymega/emacs2nixpkg";
    license = licenses.mit;
  };
}
