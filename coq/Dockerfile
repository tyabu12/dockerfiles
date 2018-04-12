FROM tyabu/base

MAINTAINER tyabu1212@gmail.com

ENV COQ_VERSION 8.6
ENV COQ_URL https://coq.inria.fr/distrib/V${COQ_VERSION}/files/coq-${COQ_VERSION}.tar.gz
# https://coq.inria.fr/distrib/SHA512SUMS
ENV COQ_SHA512 9f5f4913fda8cf83683fec9398b42d4567207c3d4b52b4638d5e09a24ed25a43905fb57a9fac1bb9f9d681bd47f3560e1da74e79348b3a3fd93e2e8c686cebae

RUN set -eux; \
  \
  buildDeps=' \
    ca-certificates \
    wget \
    make \
    ocaml-native-compilers \
  '; \
  \
  apt-get update; apt-get install -y --no-install-recommends \
    $buildDeps \
    ocaml \
    ocaml-findlib \
    camlp5 \
  ; \
  \
  mkdir -p /tmp/coq; \
  cd /tmp/coq; \
  wget -nv -O coq.tar.gz $COQ_URL; \
  echo "$COQ_SHA512 coq.tar.gz" | sha512sum -c -; \
  tar xf coq.tar.gz --strip-components=1; \
  ./configure -prefix /usr/local; \
  make -j "$(nproc)"; \
  make install; \
  rm -rf /tmp/coq; \
  \
  apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false $buildDeps; \
  apt-get clean; apt-get autoclean; \
  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

CMD ["coqtop"]
