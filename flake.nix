# SPDX-FileCopyrightText: 2023 The emacs2nixpkg Developers
#
# SPDX-License-Identifier: Apache-2.0

{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };
  outputs =
    { self
    , nixpkgs
    , flake-utils
    , ...
    }:
    flake-utils.lib.eachDefaultSystem
      (system:
      let
        pkgs = nixpkgs.outputs.legacyPackages.${system};
      in
      {
        packages.emacs2nixpkg = pkgs.callPackage ./emacs2nixpkg.nix { };
        packages.default = self.outputs.packages.${system}.emacs2nixpkg;

        devShells.default = self.packages.${system}.default.overrideAttrs (super: {
          nativeBuildInputs = with pkgs;
            super.nativeBuildInputs
            ++ [
              clippy
              rustfmt
            ];
          RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
        });
      })
    // {
      overlays.default = final: prev: {
        inherit (self.packages.${final.system}) emacs2nixpkg;
      };
    };
}
