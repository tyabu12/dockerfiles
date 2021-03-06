FROM tyabu/debian

LABEL maintainer="Tomohito Yabu <tyabu1212@gmail.com>" \
  coq_version="8.7.2"

ENV COQ_VERSION 8.7.2
ENV COQ_URL https://coq.inria.fr/distrib/V${COQ_VERSION}/files/coq-${COQ_VERSION}.tar.gz
# https://coq.inria.fr/distrib/SHA512SUMS
ENV COQ_SHA512 6117ef243c62805996a21952016acaaf21db6d1b539fc813c19c897e100f45cde2bee7c9fb045b269a241b79306c656969ca8051e3212ea2090f6d7c1afad5a8

RUN set -eux; \
  : "Install dependencies"; \
  buildDeps=' \
    ca-certificates \
    wget \
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
  mkdir -p /tmp/coq; \
  cd /tmp/coq; \
  wget -nv -O coq.tar.gz $COQ_URL; \
  echo "$COQ_SHA512 coq.tar.gz" | sha512sum -c -; \
  tar xf coq.tar.gz --strip-components=1; \
  : "Build"; \
  ./configure -prefix /usr/local; \
  make -j "$(nproc)"; \
  make install; \
  : "Clean up"; \
  rm -rf /tmp/coq; \
  apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false $buildDeps; \
  apt-get clean; apt-get autoclean; \
  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

CMD ["coqide"]