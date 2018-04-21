FROM ocaml/opam:alpine_ocaml-4.06.0

LABEL maintainer="Tomohito Yabu <tyabu1212@gmail.com>"

ENV ELIOM_VER 6.3.0

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
  \
  opam remote add git git://github.com/ocaml/opam-repository; \
  opam update; opam upgrade; \
  \
  opam install -j$(getconf _NPROCESSORS_ONLN) -y eliom.${ELIOM_VER}

EXPOSE 80

CMD ["ocsigenserver.opt"]