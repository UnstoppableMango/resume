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

      perSystem = { pkgs, ... }: {
        devShells.default = pkgs.mkShellNoCC {
          packages = with pkgs; [
            gnumake
            roboto
            typst
          ];

          TYPST_FONT_PATHS = "${pkgs.roboto}/share/fonts/truetype";
        };

        treefmt.programs = {
          nixfmt.enable = true;
        };
      };
    };
}
