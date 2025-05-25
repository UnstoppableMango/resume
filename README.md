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
  <img alt="SVG" src="./assets/2025/05/23/resume.png">
</div>

## Development

TL;DR

- `make`: Generate all assets for $FORMATS
- `make update`: Refresh `./assets` directories
- `make .envrc`: Create a `.envrc` from [example.envrc](./hack/example.envrc)

### Pre-requisites

- [rustup](https://rustup.rs/)
- [fontist](https://github.com/fontist/fontist)

#### Useful

- [rbenv](https://github.com/rbenv/rbenv)
