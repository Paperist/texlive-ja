# paperist/texlive-ja

Minimal TeX Live image for Japanese

## Install

```bash
# From Docker Hub
docker pull paperist/texlive-ja:alpine
```

```bash
# From GitHub Container Registry
docker pull ghcr.io/paperist/texlive-ja:alpine
docker image tag ghcr.io/paperist/texlive-ja:alpine paperist/texlive-ja:alpine
```

## Usage

```bash
$ docker run --rm -it -v $PWD:/workdir paperist/texlive-ja
$ latexmk -C main.tex && latexmk main.tex && latexmk -c main.tex
```

## Contributing

PRs accepted.

## License

MIT (c) 3846masa

---

Forked from [umireon/docker-texci] \(under the MIT License\).

[umireon/docker-texci]: https://github.com/umireon/docker-texci
