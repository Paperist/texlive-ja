# Copyright (c) 2016 Kaito Udagawa
# Copyright (c) 2016-2020 3846masa
# Released under the MIT license
# https://opensource.org/licenses/MIT

FROM alpine

ENV PATH /usr/local/texlive/2021/bin/x86_64-linuxmusl:$PATH

WORKDIR /tmp/install-tl-unx
COPY texlive.profile ./

RUN \
  ## Install packages
  apk add --no-cache curl perl fontconfig-dev freetype-dev && \
  apk add --no-cache --virtual .fetch-deps xz tar wget && \
  ## Install TeXLive
  curl -fsSL ftp://tug.org/historic/systems/texlive/2021/install-tl-unx.tar.gz | \
    tar -xz --strip-components=1 && \
  ./install-tl --profile=texlive.profile && \
  tlmgr install \
    collection-latexextra \
    collection-fontsrecommended \
    collection-langjapanese \
    latexmk && \
  ## Cleanup
  apk del .fetch-deps && \
  rm -rf /tmp/install-tl-unx

WORKDIR /workdir
CMD ["sh"]
