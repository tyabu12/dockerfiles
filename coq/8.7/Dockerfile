FROM tyabu/debian

LABEL maintainer="Tomohito Yabu <tyabu1212@gmail.com>" \
  coq_version="8.7.2"

ENV COQ_VERSION 8.7.2

RUN opam install -y coq.${COQ_VERSION}

CMD ["coqtop"]

