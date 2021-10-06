# Copyright (c) 2016 Kaito Udagawa
# Copyright (c) 2016-2020 3846masa
# Released under the MIT license
# https://opensource.org/licenses/MIT

FROM alpine

ENV PATH /usr/local/texlive/2021/bin/x86_64-linuxmusl:$PATH

RUN apk add --no-cache \
  curl \
  fontconfig-dev \
  freetype-dev \
  perl \
  tar \
  wget \
  xz

WORKDIR /install-tl-unx
COPY texlive.profile ./
RUN curl -fsSLO ftp://tug.org/historic/systems/texlive/2021/install-tl-unx.tar.gz
RUN tar -xzf install-tl-unx.tar.gz --strip-components=1
RUN ./install-tl --profile=texlive.profile
RUN tlmgr install \
      collection-latexextra \
      collection-fontsrecommended \
      collection-langjapanese \
      latexmk

FROM alpine
RUN apk add --no-cache \
  perl \
  fontconfig-dev \
  freetype-dev

ENV PATH /usr/local/texlive/2021/bin/x86_64-linuxmusl:$PATH
COPY --from=0 /usr/local/texlive /usr/local/texlive
WORKDIR /workdir
CMD ["sh"]
