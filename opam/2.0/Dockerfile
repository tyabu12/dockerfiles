FROM tyabu/ocaml

LABEL maintainer="Tomohito Yabu <tyabu1212@gmail.com>" \
  opam_version="2.0.2"

ENV OPAM_VERSION 2.0.2

RUN set -eux; \
  : "Install dependencies"; \
  apk update; apk upgrade; \
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
  sed -n "s/^Defaults.*requiretty//g" /etc/sudoers

USER opam
WORKDIR /home/opam

RUN set -eux; \
  : "Fetch source"; \
  mkdir -p ~/opam; \
  curl -sSL https://github.com/ocaml/opam/archive/${OPAM_VERSION}.tar.gz \
    | tar zx -C ~/opam --strip-components 1; \
  : "Compile"; \
  cd ~/opam; \
  ./configure; \
  make -j1 lib-ext all; \
  sudo -E "PATH=$PATH" make install; \
  opam init -a -y --shell='sh' --disable-sandboxing; \
  eval "$(opam env)"; \
  opam update; \
  opam config set jobs "$(nproc)"; \
  # https://discuss.ocaml.org/t/ann-opam-2-0-2/3046/11
  opam pin add -y dune 1.5.1; \
  opam install -y . --deps-only; \
  ./configure; \
  sudo -E "PATH=$PATH" make libinstall; \
  : "Clean up"; \
  opam clean; \
  sudo rm -rf ~/opam /var/cache/apk/*

ENV ENV /home/opam/.profile

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN sudo chown opam /docker-entrypoint.sh \
  && chmod 700 /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["opam"]
