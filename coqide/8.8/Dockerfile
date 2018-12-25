FROM tyabu/debian

LABEL maintainer="Tomohito Yabu <tyabu1212@gmail.com>" \
  coq_version="8.8.2"

ENV COQ_VERSION 8.8.2
ENV COQ_URL https://github.com/coq/coq/archive/V${COQ_VERSION}.tar.gz

RUN set -eux; \
  : "Install dependencies"; \
  buildDeps=' \
    ca-certificates \
    curl \
    make \
    ocaml-native-compilers \
    liblablgtk2-ocaml-dev \
    liblablgtksourceview2-ocaml-dev \
  '; \
  apt-get update; apt-get install -y --no-install-recommends \
    $buildDeps \
    ocaml \
    ocaml-findlib \
    camlp5 \
    liblablgtk2-ocaml \
    liblablgtksourceview2-ocaml \
  ; \
  : "Fetch source"; \
  mkdir -p /usr/src/coq; \
  curl -sSL $COQ_URL \
    | tar xz -C /usr/src/coq --strip-components 1; \
  : "Build"; \
  cd /usr/src/coq; \
  ./configure -prefix /usr/local; \
  make -j "$(nproc)"; \
  make install; \
  : "Clean up"; \
  rm -rf /usr/src/coq; \
  apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false $buildDeps; \
  apt-get clean; apt-get autoclean; \
  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

CMD ["coqide"]