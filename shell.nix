{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShellNoCC {
  packages = with pkgs; [
    git
    gnumake
    rustup
    ruby
    typst
  ];

  FONTIST = "bin/fontist";
  RUSTUP = pkgs.rustup + "/bin/rustup";
  RUBY = pkgs.ruby + "/bin/ruby";
  TYPST = pkgs.typst + "/bin/typst";
}
