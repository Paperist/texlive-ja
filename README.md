# paperist/texlive-ja

Minimal TeX Live image for Japanese

![size:alpine](https://flat.badgen.net/docker/size/paperist/texlive-ja/alpine/amd64?label=paperist/texlive-ja:alpine&icon=docker)
![size:debian](https://flat.badgen.net/docker/size/paperist/texlive-ja/debian/amd64?label=paperist/texlive-ja:debian&icon=docker)
![size:debian:arm64](https://flat.badgen.net/docker/size/paperist/texlive-ja/debian/arm64?label=paperist/texlive-ja:debian+|+ARM64&icon=docker)

## Supported tags and respective Dockerfile links

- [`alpine`](./alpine/Dockerfile)
  - Only AMD64 supported.
- [`latest`](./debian/Dockerfile), [`debian`](./debian/Dockerfile)
  - AMD64, ARM64 supported.

## Install

```bash
# From Docker Hub
docker pull paperist/texlive-ja:latest
```

```bash
# From GitHub Container Registry
docker pull ghcr.io/paperist/texlive-ja:latest
docker image tag ghcr.io/paperist/texlive-ja:alpine paperist/texlive-ja:latest
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
