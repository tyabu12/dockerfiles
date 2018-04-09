FROM tyabu/base

MAINTAINER tyabu1212@gmail.com

ENV COQ_VERSION 8.6
ENV COQ_URL https://coq.inria.fr/distrib/V${COQ_VERSION}/files/coq-${COQ_VERSION}.tar.gz
ENV COQ_SHA1_URL https://coq.inria.fr/distrib/V${COQ_VERSION}/files/coq-${COQ_VERSION}.tar.gz.sha1

RUN set -eux; \
  \
    buildDeps=' \
      ca-certificates \
      wget \
      make \
    '; \
  \
  apt-get update; apt-get install -y --no-install-recommends \
    $buildDeps \
    ocaml \
    ocaml-native-compilers \
    ocaml-findlib \
    camlp5 \
    liblablgtk2-ocaml-dev \
    liblablgtksourceview2-ocaml-dev \
    libgtk2.0-dev \
    libocamlgraph-ocaml-dev \
    ; \
  \
  mkdir -p /tmp/coq; \
  cd /tmp/coq; \
  wget $COQ_URL; \
  wget $COQ_SHA1_URL; \
  sha1sum -c coq*.sha1; \
  tar xf coq*.tar.gz --strip-components=1; \
  ./configure -prefix /usr/local; \
  make; \
  make install; \
  rm -rf /tmp/coq; \
  \
  apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false $buildDeps; \
  apt-get clean; apt-get autoclean; \
  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

CMD ["coqide"]
