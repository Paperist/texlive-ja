FROM alpine:3.24.0@sha256:a2d49ea686c2adfe3c992e47dc3b5e7fa6e6b5055609400dc2acaeb241c829f4 AS installer
ENV PATH /usr/local/bin/texlive:$PATH
WORKDIR /install-tl-unx
RUN apk add --no-cache \
  perl \
  tar \
  wget \
  xz \
  fontconfig
COPY ./texlive.profile ./
RUN wget -nv https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
RUN tar -xzf ./install-tl-unx.tar.gz --strip-components=1
RUN ./install-tl --profile=texlive.profile
RUN ln -sf /usr/local/texlive/*/bin/* /usr/local/bin/texlive
RUN tlmgr install \
  collection-fontsrecommended \
  collection-langjapanese \
  collection-latexextra \
  latexmk

FROM alpine:3.24.0@sha256:a2d49ea686c2adfe3c992e47dc3b5e7fa6e6b5055609400dc2acaeb241c829f4
ENV PATH /usr/local/bin/texlive:$PATH
WORKDIR /workdir
COPY --from=installer /usr/local/texlive /usr/local/texlive
RUN apk add --no-cache \
  bash \
  perl \
  wget
RUN ln -sf /usr/local/texlive/*/bin/* /usr/local/bin/texlive
CMD ["bash"]
