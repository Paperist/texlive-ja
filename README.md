# smkwlab/texlive-ja-textlint

textlint 入りコンパクトな日本語向け TeXLive Docker イメージ

![size:alpine](https://flat.badgen.net/docker/size/smkwlab/texive-ja-textlint/alpine/amd64?label=smkwlab/texive-ja-textlint:alpine&icon=docker)
![size:debian](https://flat.badgen.net/docker/size/smkwlab/texive-ja-textlint/debian/amd64?label=smkwlab/texive-ja-textlint:debian&icon=docker)
![size:debian:arm64](https://flat.badgen.net/docker/size/smkwlab/texive-ja-textlint/debian/arm64?label=smkwlab/texive-ja-textlint:debian+|+ARM64&icon=docker)

## Supported tags / タグ一覧

- [`alpine`](./alpine/Dockerfile)
  - Only AMD64 supported.
  - AMD64 のみ対応しています
- [`latest`](./debian/Dockerfile), [`debian`](./debian/Dockerfile)
  - AMD64, ARM64 supported.
  - AMD64, ARM64 (M1 mac) に対応しています

## Install / インストール

GitHub Container Registry からインストールできます

### GitHub Container Registry

```bash
docker pull ghcr.io/smkwlab/texive-ja-textlint:latest
docker image tag ghcr.io/smkwlab/texive-ja-textlint:latest smkwlab/texive-ja-textlint:latest
```

## Usage / 使い方

```bash
$ docker run --rm -it -v $PWD:/workdir ghcr.io/smkwlab/texive-ja-textlint:latest \
    sh -c 'latexmk -C main.tex && latexmk main.tex && latexmk -c main.tex'
```

詳しくは、[使い方](./docs/usage.md) を参照してください

## Contributing / コントリビュートについて

バグ修正は歓迎します

現在、機能追加やバグ以外の修正は、基本的に受け付けていません

機能を追加したい場合は、このイメージを基に拡張したイメージを作ることができます

詳しくは、[使い方「イメージを拡張する」](./docs/usage.md) を参照してください

## License / ライセンス

MIT (c) 3846masa

---

Forked from [umireon/docker-texci] \(under the MIT License\).

[umireon/docker-texci]: https://github.com/umireon/docker-texci
