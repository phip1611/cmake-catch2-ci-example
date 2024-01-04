{
  description = "A very basic flake";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    nixpkgs.url = "github:NixOS/nixpkgs/23.11";
  };

  outputs =
    inputs@{ self
    , nixpkgs
    , flake-parts
    }: flake-parts.lib.mkFlake { inherit inputs; } {
      flake = { };
      systems = nixpkgs.lib.systems.flakeExposed;
      perSystem = { config, pkgs, ... }: {
        packages = rec {
          default = libfoo;
          libfoo = pkgs.stdenv.mkDerivation {
            name = "libfoo";
            version = "0.0.0";
            # src = pkgs.lib.sources.cleanSource ./.;
            src = pkgs.nix-gitignore.gitignoreSource [] ./.;
            doCheck = true;
            checkInputs = [ pkgs.catch2_3 ];
            nativeBuildInputs = [ pkgs.cmake pkgs.gcc13 ];
          };
        };

        devShells = {
          default = pkgs.mkShell {
            inputsFrom = [ self.packages.${pkgs.system}.libfoo ];
            packages = with pkgs; [ ];
          };
        };

        formatter = pkgs.nixpkgs-fmt;
      };
    };
}
