FROM tyabu/debian

LABEL maintainer="Tomohito Yabu <tyabu1212@gmail.com>" \
  coq_version="8.6.1"

ENV COQ_VERSION 8.6.1
ENV COQ_URL https://coq.inria.fr/distrib/V${COQ_VERSION}/files/coq-${COQ_VERSION}.tar.gz
# https://coq.inria.fr/distrib/SHA512SUMS
ENV COQ_SHA512 814ab76a06ca15f927081428da74add4bc67290199fa011853b9c68a00cdefaf813b10fbac18a434f4504fce8f2173eb544080bf6f50d62caa41bb8724b13083

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