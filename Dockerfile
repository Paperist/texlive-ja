# Copyright (c) 2016 Kaito Udagawa
# Copyright (c) 2016-2019 3846masa
# Copyright (c) 2020 Shigemi ISHIDA
# Released under the MIT license
# https://opensource.org/licenses/MIT

FROM frolvlad/alpine-glibc:latest

ENV PATH /usr/local/texlive/2020/bin/x86_64-linux:$PATH

RUN apk add --no-cache curl perl fontconfig-dev freetype-dev && \
    apk add --no-cache --virtual .fetch-deps xz tar && \
    mkdir /tmp/install-tl-unx && \
    curl -L ftp://tug.org/historic/systems/texlive/2020/install-tl-unx.tar.gz | \
    tar -xz -C /tmp/install-tl-unx --strip-components=1 && \
    printf "%s\n" \
      "selected_scheme scheme-basic" \
      "tlpdbopt_install_docfiles 0" \
      "tlpdbopt_install_srcfiles 0" \
      > /tmp/install-tl-unx/texlive.profile && \
    /tmp/install-tl-unx/install-tl \
      --profile=/tmp/install-tl-unx/texlive.profile && \
    mkdir -p /usr/local/share/gs && \
    curl -L https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs952/ghostscript-9.52-linux-x86_64.tgz | \
    tar -xz -C /usr/local/share/gs --strip-components=1 && \
    ln -s /usr/local/share/gs/gs-952-linux-x86_64 /usr/bin/gs && \
    tlmgr install \
      collection-latexextra \
      collection-fontsrecommended \
      collection-langjapanese \
      epstopdf \
      latexmk && \
    rm -fr /tmp/install-tl-unx && \
    apk del .fetch-deps

WORKDIR /workdir

CMD ["sh"]
