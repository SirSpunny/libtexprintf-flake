{
  description = "libtexprintf - printf-style formatted output with TeX-like syntax";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages.default = pkgs.stdenv.mkDerivation rec {
          pname = "libtexprintf";
          version = "1.31";

          src = pkgs.fetchFromGitHub {
            owner = "bartp5";
            repo = "libtexprintf";
            rev = "v${version}";
            hash = "sha256-OXDcohfSfik0H1MpoznN267OVTYkW75N+TIF6lRRvZ0=";
          };

          nativeBuildInputs = with pkgs; [
            autoreconfHook
          ];

          meta = {
            description = "Library providing printf-style formatted output with TeX-like syntax";
            homepage = "https://github.com/bartp5/libtexprintf";
            license = pkgs.lib.licenses.gpl3Only;
            maintainers = [];
            platforms = pkgs.lib.platforms.unix;
            mainProgram = "utftex";
          };
        };
      }
    );
}
