# libtexprintf Nix Flake

A Nix flake wrapper for [libtexprintf](https://github.com/bartp5/libtexprintf) by [bartp5](https://github.com/bartp5).

## Disclaimer

This repository contains **no original work**. It is a personal Nix packaging wrapper and nothing more. All credit, praise, and recognition belongs entirely to the original author. If you find libtexprintf useful, please star and support the [original repository](https://github.com/bartp5/libtexprintf).

This flake is provided for personal convenience and **will not be actively maintained**. It may break as upstream or nixpkgs evolve, and there is no guarantee of timely updates.

## What is libtexprintf?

libtexprintf is a library and CLI tool (`utftex`) for pretty-printing math in monospace fonts using a TeX-like syntax, producing UTF-8 encoded text. See the [upstream README](https://github.com/bartp5/libtexprintf) for full documentation.

## Usage

### As a flake input

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    libtexprintf.url = "github:SirSpunny/libtexprintf-flake";
  };

  outputs = { self, nixpkgs, libtexprintf }: {
    # libtexprintf.packages.x86_64-linux.default
  };
}
```

### Try it without installing

```bash
nix run github:SirSpunny/libtexprintf-flake -- '\frac{\alpha}{\beta+x}'
```

### Build locally

```bash
nix build .
```

## How the build works

libtexprintf is an autotools project (`configure.ac` + `Makefile.am`). This flake does not implement any custom build logic - it simply uses Nix's `autoreconfHook` to invoke the project's own preconfigured autotools pipeline (`autoreconf`  `./configure`  `make`  `make install`).

## License

libtexprintf is licensed under **GPL-3.0**. See the [upstream license](https://github.com/bartp5/libtexprintf/blob/main/COPYING) for details. This wrapper carries no additional license.
