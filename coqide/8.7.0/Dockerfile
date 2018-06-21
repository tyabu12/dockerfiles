FROM tyabu/debian

LABEL maintainer="Tomohito Yabu <tyabu1212@gmail.com>"

ENV COQ_VERSION 8.7.0
ENV COQ_URL https://coq.inria.fr/distrib/V${COQ_VERSION}/files/coq-${COQ_VERSION}.tar.gz
# https://coq.inria.fr/distrib/SHA512SUMS
ENV COQ_SHA512 c806881d1ab823d9c2d748aa2d7fd3faaa0f6395536942ad214c68658b2688e6c57941947a440ddb69bf1436249067eefd866ecb1d9e4c5e774e3218c80a6fc2

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

CMD ["coqide"]
