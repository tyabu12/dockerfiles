FROM alpine:3.7

LABEL maintainer="Tomohito Yabu <tyabu1212@gmail.com>"

ENV OCAML_VERSION 4.06.1

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
  wget -O ocaml.tar.gz https://github.com/ocaml/ocaml/archive/${OCAML_VERSION}.tar.gz; \
  tar xf ocaml.tar.gz -C /usr/src/ocaml --strip-components 1; \
  rm ocaml.tar.gz; \
  cd ocaml; \
  : "Build"; \
  ./configure; \
  make world.opt -j"$(nproc)"; \
  make install; \
  : "Clean up"; \
  cd ../; \
  rm -rf ./ocaml; \
  apk del .fetch-deps

CMD ["ocaml"]
