<!-- markdownlint-disable MD033 -->

# [Erik Rasmussen's](https://github.com/UnstoppableMango) Resume

[![Download PDF](https://img.shields.io/badge/Download-PDF-maroon)](https://github.com/UnstoppableMango/resume/releases/latest/download/resume.pdf)
[![Download PNG](https://img.shields.io/badge/Download-PNG-darkgreen)](https://github.com/UnstoppableMango/resume/releases/latest/download/resume.png)
[![Download SVG](https://img.shields.io/badge/Download-SVG-darkorange)](https://github.com/UnstoppableMango/resume/releases/latest/download/resume.svg)
[![Font Roboto](https://img.shields.io/badge/Font-Roboto-green)](https://fonts.google.com/specimen/Roboto)
[![Font Roboto Thin](https://img.shields.io/badge/Font-Roboto_Thin-green)](https://fonts.google.com/specimen/Roboto)

This repository contains the [source code](./resume.typ) for my Resume.
Written in [Typst](https://github.com/typst/typst).
Over-engineered with [Cargo](https://doc.rust-lang.org/cargo/index.html) and [Make](https://www.gnu.org/software/make/).

<div align="center">
  <img alt="Resume" src="https://raw.githubusercontent.com/UnstoppableMango/resume/gh-pages/resume.png">
</div>

## Development

TL;DR

- `make build`: Generate all assets to `./assets/`
- `nix build`: Build hermetically via Nix (output in `./result/`)
- `make .envrc`: Create a `.envrc` from [example.envrc](./hack/example.envrc)

### Point-in-time builds

Generate outputs for any commit without touching HEAD:

```shell
# shell script (requires typst in PATH)
./scripts/build-at v2025.05.23 ./out

# Nix (fully hermetic, no local deps needed)
nix build 'github:UnstoppableMango/resume/v2025.05.23#default'
```

### Inputs

Phone is parameterized in the hope that I don't accidentally dox myself.

```shell
$ make PHONE='555-555-5555'
typst compile resume.typ assets/resume.pdf --input phone=555-555-5555
typst compile resume.typ assets/resume.png --input phone=555-555-5555
typst compile resume.typ assets/resume.svg --input phone=555-555-5555
```
