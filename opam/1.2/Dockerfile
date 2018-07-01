FROM tyabu/ocaml

LABEL maintainer="Tomohito Yabu <tyabu1212@gmail.com>" \
  opam_version="1.2.2"

ENV OPAM_VERSION 1.2.2

RUN set -eux; \
  : "Install dependencies"; \
  apk upgrade; \
  apk add --no-cache \
    sudo \
    g++ \
    m4 \
    perl \
    aspcud \
    curl \
    tar \
    git \
    rsync \
    mercurial \
    opam \
    patch \
  ; \
  : "Add opam user"; \
  adduser -S opam; \
  echo "opam ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/opam; \
  chmod 440 /etc/sudoers.d/opam; \
  chown root:root /etc/sudoers.d/opam; \
  sed "s/^Defaults.*requiretty//g" /etc/sudoers

USER opam
WORKDIR /home/opam

RUN set -eux; \
  : "Init opam"; \
  opam init -a -y; \
  eval "opam config env"; \
  opam update; \
  opam install -y opam-lib --deps-only; \
  : "Clean up"; \
  sudo rm -rf /var/cache/apk/*

CMD ["opam"]
