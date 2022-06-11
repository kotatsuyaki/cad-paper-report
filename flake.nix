{
  description = "A very basic flake";
  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixpkgs-unstable;
  inputs.utils.url = github:numtide/flake-utils;

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import "${nixpkgs}" {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
        deps = with pkgs; [
          texlive.combined.scheme-full
          pandoc
          haskellPackages.pandoc-crossref
          librsvg
          gnumake
        ];
        fonts-conf = pkgs.makeFontsConf {
          fontDirectories = [
            pkgs.source-han-serif
            pkgs.edukai
          ];
        };
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = deps;
          FONTCONFIG_FILE = fonts-conf;
        };
        defaultPackage = pkgs.stdenv.mkDerivation {
          name = "main.pdf";
          src = ./.;
          buildInputs = deps;
          buildPhase = "make";
          installPhase = ''
            mkdir -p $out
            cp main.pdf $out
          '';
          FONTCONFIG_FILE = fonts-conf;
        };
      });
}
