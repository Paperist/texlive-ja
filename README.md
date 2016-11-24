# 3846masa/alpine-texlive-ja

[![Docker Automated buil](https://img.shields.io/docker/automated/3846masa/alpine-texlive-ja.svg)](https://hub.docker.com/r/3846masa/alpine-texlive-ja/)
[![Docker Image Size](https://images.microbadger.com/badges/image/3846masa/alpine-texlive-ja.svg)](https://microbadger.com/images/3846masa/alpine-texlive-ja "Get your own image badge on microbadger.com")
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
docker pull 3846masa/alpine-texlive-ja
```

## Usage

```bash
$ docker run --rm -it -v $PWD:/workdir 3846masa/alpine-texlive-ja
$ cd /workdir
$ latexmk -C main.tex && latexmk main.tex && latexmk -c main.tex
```

## Contribute

PRs accepted.

## License

MIT © 3846masa



