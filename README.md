# pman0214/alpine-texlive-ja-epspdf

[![Docker Build](https://img.shields.io/docker/automated/pman0214/alpine-texlive-ja-epspdf.svg)](https://hub.docker.com/r/pman0214/alpine-texlive-ja-epspdf/)

> Minimal Japanese TeX Live image based on alpine with epstopdf support for pdflatex

Forked from [paperist/alpine-texlive-ja] \(under the MIT License\) and added epstopdf as well as Ghostscript.

[paperist/alpine-texlive-ja]: https://github.com/Paperist/docker-alpine-texlive-ja

## Table of Contents

- [Install](#install)
- [Usage](#usage)
- [Contribute](#contribute)
- [License](#license)

## Install

```bash
docker pull pman0214/alpine-texlive-ja-epspdf
```

## Usage

```bash
$ docker run --rm -it -v $PWD:/workdir pman0214/alpine-texlive-ja-epspdf
$ latexmk -C main.tex && latexmk main.tex && latexmk -c main.tex
```

## Contribute

PRs accepted.

## License

This software is released under the MIT license. See ``LICENSE.txt``.

* Copyright (c) 2016 Kaito Udagawa
* Copyright (c) 2016-2019 3846masa
* Copyright (c) 2020 Shigemi ISHIDA
