# pman0214/alpine-texlive-ja-epspdf

[![Docker Build](https://img.shields.io/docker/cloud/automated/pman0214/gatsbyjs-alpine.svg)](https://hub.docker.com/r/pman0214/alpine-texlive-ja-epspdf/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

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

Default ``WORKDIR`` is ``/workdir``.

```bash
docker run --rm -it -v $PWD:/workdir pman0214/alpine-texlive-ja-epspdf 'latexmk -C main.tex && latexmk main.tex'
```

## Contribute

* Bugfix pull requests are welcome.

## License

This software is released under the MIT license. See ``LICENSE.txt``.

* Copyright (c) 2016 Kaito Udagawa
* Copyright (c) 2016-2019 3846masa
* Copyright (c) 2020 Shigemi ISHIDA
