FROM ocaml/opam:alpine_ocaml-4.04.2

ENV ELIOM_VER 6.2.0

RUN set -eux; \
  \
  sudo apk update; sudo apk upgrade; \
  sudo apk --no-cache add \
    perl \
    m4 \
    pkgconfig \
    gmp-dev \
    pcre-dev \
    openssl-dev \
    gdbm-dev \
  ; \
  opam update; opam upgrade; \
  \
  NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1); \
  opam install -j $NPROC -y eliom.${ELIOM_VER}

EXPOSE 80

CMD ["ocsigenserver.opt"]
