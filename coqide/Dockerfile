FROM tyabu/base
MAINTAINER tyabu1212@gmail.com

ENV COQ_VERSION 8.6
ENV COQ_URL https://coq.inria.fr/distrib/V${COQ_VERSION}/files/coq-${COQ_VERSION}.tar.gz

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
  cd /tmp; \
  wget -O coq.tar.gz $COQ_URL; \
  tar xf coq.tar.gz; \
  rm -rf coq.tar.gz; \
  cd coq; \
  ./configure -prefix /usr/local; \
  make; \
  make install; \
  cd ..; \
  rm -rf coq; \
  \
  apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false $buildDeps; \
  apt-get clean; apt-get autoclean; \
  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

CMD ["coqide"]
