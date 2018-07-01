FROM tyabu/ocaml

LABEL maintainer="Tomohito Yabu <tyabu1212@gmail.com>" \
  opam_version="2.0.0-rc3"

ENV OPAM_VERSION 2.0.0-rc3

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
    wget \
    tar \
    unzip \
    git \
    rsync \
    mercurial \
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
  : "Fetch source"; \
  mkdir ~/opam; \
  wget -O opam.tar.gz https://github.com/ocaml/opam/archive/${OPAM_VERSION}.tar.gz; \
  tar xf opam.tar.gz -C ~/opam --strip-components 1; \
  rm -f opam.tar.gz; \
  : "Compile"; \
  cd ~/opam; \
  ./configure; \
  make -j1 lib-ext all; \
  sudo -E "PATH=$PATH" make install; \
  opam init -a -y --shell='sh' --disable-sandboxing; \
  eval "$(opam env)"; \
  opam update; \
  opam install -y . --deps-only; \
  ./configure; \
  sudo -E "PATH=$PATH" make libinstall; \
  : "Clean up"; \
  cd; \
  sudo rm -rf ~/opam /var/cache/apk/*

ENV ENV /home/opam/.profile

CMD ["opam"]
