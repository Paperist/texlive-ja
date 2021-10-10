# Usage / 使い方

This article is in Japanese only.

- [latexmk を使う](#latexmk-を使う)
- [VSCode LaTeX Workshop で使う](#vscode-latex-workshop-で使う)
- [好きなスタイルファイルを読み込む](#好きなスタイルファイルを読み込む)
- [好きなフォントを読み込む](#好きなフォントを読み込む)
  - [macOS でヒラギノフォントを使う](#macos-でヒラギノフォントを使う)
  - [任意のフォントを使う](#任意のフォントを使う)
- [イメージを拡張する](#イメージを拡張する)

## latexmk を使う

paperist/texlive-ja には、latexmk がインストールされています

例えば、upLaTeX でビルドしたい場合、次のように `latexmkrc` ファイルを作ると、`latexmk` コマンドだけでビルドできます

```perl
$latex = 'uplatex %O -synctex=1 -interaction=nonstopmode -file-line-error %S';
$bibtex = 'upbibtex %O %B';
$biber = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$dvipdf = 'dvipdfmx %O -o %D %S';
$makeindex = 'upmendex %O -o %D %S';
$pdf_mode = 3;
```

```bash
$ docker run --rm -it -v $PWD:/workdir paperist/texlive-ja:latest \
    sh -c 'latexmk -C main.tex && latexmk main.tex && latexmk -c main.tex'
```

## VSCode LaTeX Workshop で使う

paperist/texlive-ja は、[LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) で使えます

「latexmk を使う」を参考に `latexmkrc` を用意したあと、次のように VSCode の設定を書き換えます

```json
{
  "latex-workshop.docker.enabled": true,
  "latex-workshop.docker.image.latex": "paperist/texlive-ja:latest",
  "latex-workshop.latex.tools": [
    {
      "name": "latexmk",
      "command": "latexmk",
      "args": ["-gg", "%DOC%"]
    }
  ],
  "latex-workshop.latex.autoClean.run": "onBuilt"
}
```

## 好きなスタイルファイルを読み込む

`TEXINPUTS` 環境変数にスタイルファイルが含まれるディレクトリを指定すると、該当のディレクトリ内を検索してくれます

例えば、 `./sty` にスタイルファイルを配置する場合、`latexmkrc` へ次のように追記します

```perl
ensure_path('TEXINPUTS', './sty//');
```

## 好きなフォントを読み込む

`OSFONTDIR` 環境変数にフォントが含まれるディレクトリを指定すると、該当のディレクトリ内を検索してくれます

例えば、 `./fonts` にフォントを配置する場合、`latexmkrc` へ次のように追記します

```perl
ensure_path('OSFONTDIR', './fonts');
```

### macOS でヒラギノフォントを使う

`OSFONTDIR` 環境変数で指定したディレクトリにヒラギノフォントをコピーします

```bash
#!/bin/bash
cp '/System/Library/Fonts/ヒラギノ明朝 ProN.ttc'     ./fonts/HiraginoSerif.ttc
cp '/System/Library/Fonts/ヒラギノ角ゴシック W0.ttc' ./fonts/HiraginoSans-W0.ttc
cp '/System/Library/Fonts/ヒラギノ角ゴシック W1.ttc' ./fonts/HiraginoSans-W1.ttc
cp '/System/Library/Fonts/ヒラギノ角ゴシック W2.ttc' ./fonts/HiraginoSans-W2.ttc
cp '/System/Library/Fonts/ヒラギノ角ゴシック W3.ttc' ./fonts/HiraginoSans-W3.ttc
cp '/System/Library/Fonts/ヒラギノ角ゴシック W4.ttc' ./fonts/HiraginoSans-W4.ttc
cp '/System/Library/Fonts/ヒラギノ角ゴシック W5.ttc' ./fonts/HiraginoSans-W5.ttc
cp '/System/Library/Fonts/ヒラギノ角ゴシック W6.ttc' ./fonts/HiraginoSans-W6.ttc
cp '/System/Library/Fonts/ヒラギノ角ゴシック W7.ttc' ./fonts/HiraginoSans-W7.ttc
cp '/System/Library/Fonts/ヒラギノ角ゴシック W8.ttc' ./fonts/HiraginoSans-W8.ttc
cp '/System/Library/Fonts/ヒラギノ角ゴシック W9.ttc' ./fonts/HiraginoSans-W9.ttc
cp '/System/Library/Fonts/ヒラギノ丸ゴ ProN W4.ttc'  ./fonts/HiraginoSansR-W4.ttc
```

`pxchfon-extras.def` を TeX ファイルと同じディレクトリ、もしくは `TEXINPUTS` で定義したディレクトリにいれます

```bash
$ wget https://github.com/zr-tex8r/PXchfon-extras/raw/master/pxchfon-extras.def
```

次のように `hiragino-highsierra-pron` もしくは `hiragino-highsierra-pro` オプションをつけて `pxchfon` を読み込みます

```tex
\usepackage[hiragino-highsierra-pron]{pxchfon}
```

### 任意のフォントを使う

`OSFONTDIR` 環境変数で指定したディレクトリにフォントをコピーして、フォントファイル名を `\setminchofont` や `\setgothicfont` などで指定します

```tex
\usepackage[noalphabet]{pxchfon}
%% 源暎ちくご明朝を使う場合の例
\setminchofont{GenEiChikugoMin2-R.ttf}
```

詳しくは PXchfon のドキュメントを参照してください

## イメージを拡張する

paperist/texlive-ja には、最小限のパッケージしかインストールされていません

もし、paperist/texlive-ja 内臓のパッケージだけでは足りない場合、自分で Docker イメージを拡張できます

tlmgr で任意のパッケージをインストールするには、次のように Dockerfile を作成して、任意のイメージ名でビルドします

```dockerfile
FROM paperist/texlive-ja:latest
# XeTeX をインストールする場合の例
RUN apt-get update \
  && apt-get install -y \
    libfontconfig1 \
  && rm -rf /var/lib/apt/lists/*
RUN tlmgr install collection-xetex ctex
```

```bash
$ docker build -t example/texlive-ja:latest .
```

```bash
$ docker run --rm -it -v $PWD:/workdir example/texlive-ja:latest \
    sh -c 'xelatex main.tex'
```
