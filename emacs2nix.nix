{ lib
, pkgs ? import <nixpkgs>
, rustPlatform
,
}:
rustPlatform.buildRustPackage {
  name = "emacs2nix";

  src = lib.cleanSource ./.;

  cargoLock = {
    lockFile = ./Cargo.lock;
    allowBuiltinFetchGit = true;
  };

  nativeBuildInputs = [ ];
  buildInputs = [ ];

  meta = with lib; {
    description = "Emacs configuration parser, for use with Nix.";
    homepage = "https://github.com/shymega/emacs2nix";
    license = licenses.mit;
  };
}
