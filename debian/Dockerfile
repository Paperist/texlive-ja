FROM debian:11.6-slim AS installer
ENV PATH /usr/local/bin/texlive:$PATH
WORKDIR /install-tl-unx
RUN apt-get update
RUN apt-get install -y \
  perl \
  wget \
  xz-utils \
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

FROM node:14-buster-slim
ENV PATH /usr/local/bin/texlive:/npm/node_modules/.bin:$PATH
COPY --from=installer /usr/local/texlive /usr/local/texlive
RUN apt-get update && \
    apt-get install -y \
      perl \
      wget \
    && rm -rf /var/lib/apt/lists/*
RUN ln -sf /usr/local/texlive/*/bin/* /usr/local/bin/texlive

WORKDIR /npm
COPY ["package.json", "package-lock.json", "/npm"]
RUN \
    npm install /npm

WORKDIR /workdir
CMD ["bash"]
