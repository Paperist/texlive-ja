FROM alpine:3.17.1 AS installer
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

FROM alpine:3.17.1
ENV PATH /usr/local/bin/texlive:/npm/node_modules/.bin:$PATH
COPY --from=installer /usr/local/texlive /usr/local/texlive
RUN apk add --no-cache \
      perl \
      wget \
      bash
RUN ln -sf /usr/local/texlive/*/bin/* /usr/local/bin/texlive

WORKDIR /npm
COPY ["package.json", "package-lock.json", "/npm"]
RUN apk add --no-cache npm &&\
    npm install /npm

WORKDIR /workdir
CMD ["bash"]
