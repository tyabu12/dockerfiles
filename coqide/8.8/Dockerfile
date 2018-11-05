FROM tyabu/debian

LABEL maintainer="Tomohito Yabu <tyabu1212@gmail.com>" \
  coq_version="8.8.2"

ENV COQ_VERSION 8.8.2
ENV COQ_URL https://github.com/coq/coq/archive/V${COQ_VERSION}.tar.gz

RUN set -eux; \
  \
  buildDeps=' \
    ca-certificates \
    wget \
    make \
    ocaml-native-compilers \
    liblablgtk2-ocaml-dev \
    liblablgtksourceview2-ocaml-dev \
  '; \
  \
  apt-get update; apt-get install -y --no-install-recommends \
    $buildDeps \
    ocaml \
    ocaml-findlib \
    camlp5 \
    liblablgtk2-ocaml \
    liblablgtksourceview2-ocaml \
  ; \
  \
  mkdir -p /tmp/coq; \
  cd /tmp/coq; \
  wget -qO coq.tar.gz $COQ_URL; \
  tar xf coq.tar.gz --strip-components=1; \
  ./configure -prefix /usr/local; \
  make -j "$(nproc)"; \
  make install; \
  rm -rf /tmp/coq; \
  \
  apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false $buildDeps; \
  apt-get clean; apt-get autoclean; \
  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

CMD ["coqide"]
