# Copyright (c) 2016 Kaito Udagawa
# Copyright (c) 2016-2020 3846masa
# Released under the MIT license
# https://opensource.org/licenses/MIT

FROM debian:bullseye-slim

ARG TEXBINARCH=aarch64

ENV PATH /usr/local/texlive/2021/bin/${TEXBINARCH}-linux:${PATH}

RUN apt-get update && apt-get install -y \
  curl \
  libfontconfig1-dev \
  libfreetype-dev \
  perl \
  wget \
  xz-utils \
  && rm -rf /var/lib/apt/lists/*
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
    apt-get purge -y \
      wget \
      xz-utils

WORKDIR /workdir
RUN rm -fr /tmp/install-tl-unx

CMD ["bash"]
