# Copyright (c) 2016 Kaito Udagawa
# Copyright (c) 2016-2020 3846masa
# Released under the MIT license
# https://opensource.org/licenses/MIT

FROM alpine

ENV PATH /usr/local/texlive/2021/bin/x86_64-linuxmusl:$PATH

RUN apk add --no-cache curl perl fontconfig-dev freetype-dev && \
    apk add --no-cache --virtual .fetch-deps xz tar wget
WORKDIR /tmp/install-tl-unx
COPY texlive.profile ./
RUN curl -fsSL ftp://tug.org/historic/systems/texlive/2021/install-tl-unx.tar.gz | \
      tar -xz --strip-components=1 && \
    ./install-tl --profile=texlive.profile && \
    tlmgr install \
      collection-latexextra \
      collection-fontsrecommended \
      collection-langjapanese \
      latexmk && \
    apk del .fetch-deps

WORKDIR /workdir
RUN rm -fr /tmp/install-tl-unx

CMD ["sh"]
