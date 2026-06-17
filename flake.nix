{
  description = "Resume build environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    systems.url = "github:nix-systems/default";
    flake-parts.url = "github:hercules-ci/flake-parts";

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = with inputs; [ treefmt-nix.flakeModule ];
      systems = import inputs.systems;

      perSystem =
        { pkgs, ... }:
        let
          fontPaths = builtins.concatStringsSep ":" [
            "${pkgs.roboto}/share/fonts/truetype"
            "${pkgs.font-awesome}/share/fonts/opentype"
            "${pkgs.nerd-fonts.symbols-only}/share/fonts/truetype"
          ];
        in
        {
          packages.default = pkgs.stdenv.mkDerivation {
            name = "resume";
            src = ./.;
            nativeBuildInputs = [ pkgs.typst ];
            TYPST_FONT_PATHS = fontPaths;
            buildPhase = ''
              typst compile resume.typ resume.pdf
              typst compile resume.typ resume.png --pages 1
              typst compile resume.typ resume.svg --pages 1
            '';
            installPhase = ''
              mkdir -p $out
              cp resume.pdf resume.png resume.svg $out/
            '';
          };

          devShells.default = pkgs.mkShellNoCC {
            packages = with pkgs; [
              gnumake
              roboto
              font-awesome
              nerd-fonts.symbols-only
              typst
            ];

            TYPST_FONT_PATHS = fontPaths;
          };

          treefmt.programs = {
            nixfmt.enable = true;
          };
        };
    };
}
