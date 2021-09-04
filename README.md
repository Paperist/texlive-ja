# paperist/alpine-texlive-ja

[![standard-readme compliant](https://img.shields.io/badge/standard--readme-OK-green.svg)](https://github.com/RichardLitt/standard-readme)

> Minimal TeX Live image for Japanese based on alpine

Forked from [umireon/docker-texci] \(under the MIT License\).

[umireon/docker-texci]: https://github.com/umireon/docker-texci

## Table of Contents

- [Install](#install)
- [Usage](#usage)
- [Contribute](#contribute)
- [License](#license)

## Install

```bash
# From Docker Hub
docker pull paperist/alpine-texlive-ja:latest
```

```bash
# From GitHub Container Registry
docker pull ghcr.io/paperist/alpine-texlive-ja:latest
docker image tag ghcr.io/paperist/alpine-texlive-ja:latest paperist/alpine-texlive-ja:latest
```

## Usage

```bash
$ docker run --rm -it -v $PWD:/workdir paperist/alpine-texlive-ja
$ latexmk -C main.tex && latexmk main.tex && latexmk -c main.tex
```

## Contribute

PRs accepted.

## License

MIT © 3846masa
