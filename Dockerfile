# Copyright (c) 2016 Kaito Udagawa
# Copyright (c) 2016-2020 3846masa
# Copyright (c) 2021 ebal5
# Released under the MIT license
# https://opensource.org/licenses/MIT

FROM frolvlad/alpine-glibc:latest as base
RUN apk add --no-cache curl perl fontconfig-dev freetype-dev

FROM base as builder
ENV PATH /usr/local/texlive/2020/bin/x86_64-linuxmusl:$PATH

RUN apk add --no-cache --virtual .fetch-deps xz tar wget
WORKDIR /tmp/install-tl-unx
RUN curl -L ftp://tug.org/historic/systems/texlive/2020/install-tl-unx.tar.gz | \
  tar -xz -C /tmp/install-tl-unx --strip-components=1 && \
  printf "%s\n" \
  "selected_scheme scheme-basic" \
  "tlpdbopt_install_docfiles 0" \
  "tlpdbopt_install_srcfiles 0" \
  > /tmp/install-tl-unx/texlive.profile
RUN /tmp/install-tl-unx/install-tl --profile=/tmp/install-tl-unx/texlive.profile

FROM base as alpine-texlive-ja-llmk
COPY --from=builder /usr/local/texlive/ /usr/local/texlive
ENV PATH /usr/local/texlive/2020/bin/x86_64-linuxmusl:$PATH
RUN tlmgr install \
  biber \
  biblatex \
  collection-fontsrecommended \
  collection-langjapanese \
  collection-latexextra \
  latexmk \
  light-latex-make \
  luacode

WORKDIR /workdir

CMD ["/bin/ash"]
