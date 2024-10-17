{ lib
, rustPlatform
,
}:
rustPlatform.buildRustPackage {
  name = "emacs2nixpkgs";

  src = lib.cleanSource ./.;

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  nativeBuildInputs = [ ];
  buildInputs = [ ];

  meta = with lib; {
    description = "Emacs configuration parser, for use with Nix.";
    homepage = "https://github.com/shymega/emacs2nixpkgs";
    license = licenses.mit;
  };
}
