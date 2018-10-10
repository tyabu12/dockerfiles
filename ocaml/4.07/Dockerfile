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
    wget \
    tar \
  ; \
  : "Fetch source"; \
  mkdir -p /usr/src/ocaml; \
  cd /usr/src/; \
  wget -qO ocaml.tar.gz https://github.com/ocaml/ocaml/archive/${OCAML_VERSION}.tar.gz; \
  tar xf ocaml.tar.gz -C /usr/src/ocaml --strip-components 1; \
  rm -f ocaml.tar.gz; \
  cd ocaml; \
  : "Build"; \
  ./configure; \
  make world.opt -j"$(nproc)"; \
  make install; \
  : "Clean up"; \
  cd ../; \
  apk del .fetch-deps; \
  rm -rf /usr/src/ocaml /var/cache/apk/*

CMD ["ocaml"]
