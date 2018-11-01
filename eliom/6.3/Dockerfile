FROM tyabu/opam

LABEL maintainer="Tomohito Yabu <tyabu1212@gmail.com>" \
  eliom_version="6.3.0"

ENV ELIOM_VERSION 6.3.0

RUN set -eux; \
  : "Install dependencies"; \
  sudo apk upgrade; \
  sudo apk add --no-cache \
    gmp \
    pcre \
    openssl \
    gdbm \
    ocaml-camlp4 \
  ; \
  sudo apk add --no-cache --virtual .build-deps \
    pkgconfig \
    gmp-dev \
    pcre-dev \
    openssl-dev \
    gdbm-dev \
    ocaml-camlp4-dev \
  ; \
  eval "$(opam env)"; \
  opam update; \
  opam config set jobs "$(nproc)"; \
  opam pin add -y eliom ${ELIOM_VERSION}; \
  : "Clean up"; \
  opam clean; \
  sudo apk del .build-deps; \
  sudo rm -rf /var/cache/apk/*

EXPOSE 80

CMD ["ocsigenserver.opt"]