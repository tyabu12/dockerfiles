FROM alpine:3.8

LABEL maintainer="Tomohito Yabu <tyabu1212@gmail.com>" \
  distro_style="apk" \
  distro="alpine" \
  distro_long="alpine-3.8" \
  arch="x86_64" \
  ocaml_version="4.07.1" \
  operatingsystem="linux"

ENV OCAML_VERSION 4.07.1

RUN set -eux; \
  : "Install dependencies"; \
  apk update; apk upgrade; \
  apk add --no-cache \
    gcc \
    libc-dev \
    make \
  ; \
  apk add --no-cache --virtual .fetch-deps \
    curl \
    tar \
  ; \
  : "Fetch source"; \
  mkdir -p /usr/src/ocaml; \
  curl -sSL https://github.com/ocaml/ocaml/archive/${OCAML_VERSION}.tar.gz \
    | tar xz -C /usr/src/ocaml --strip-components 1; \
  : "Build"; \
  cd /usr/src/ocaml; \
  ./configure; \
  make world.opt -j"$(nproc)"; \
  make install; \
  : "Clean up"; \
  apk del .fetch-deps; \
  rm -rf /usr/src/ocaml /var/cache/apk/*

CMD ["ocaml"]
