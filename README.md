# ebal/texlive-ja-llmk

> Minimal TeX Live image for Japanese based on alpine with [llmk](https://github.com/wtsnjp/llmk "GitHub Page")

Forked from [Paperist/docker-alpine-texlive-ja] \(under the MIT License\).

It can use both of llmk and latexmk.

[Paperist/docker-alpine-texlive-ja]: https://github.com/Paperist/docker-alpine-texlive-ja

## Table of Contents

- [Install](#install)
- [Usage](#usage)
- [Contribute](#contribute)
- [License](#license)

## Install

```bash
docker pull ebal/alpine-texlive-ja-llmk
```

## Usage

```bash
$ docker run --rm -it -v $(pwd):/workdir ebal/alpine-texlive-ja-llmk llmk
```

## Contribute

PRs accepted.

## License

MIT &copy; ebal5
