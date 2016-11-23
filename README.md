# 3846masa/alpine-texlive-ja

[![standard-readme compliant](https://img.shields.io/badge/standard--readme-OK-green.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

> Minimal TeX Live image for Japanese based on alpine

Forked from [umireon/docker-texci] (under the MIT License).

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



