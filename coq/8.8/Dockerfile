FROM tyabu/opam

LABEL maintainer="Tomohito Yabu <tyabu1212@gmail.com>" \
  coq_version="8.8.1"

ENV COQ_VERSION 8.8.1

RUN opam install -y coq.${COQ_VERSION}

CMD ["coqtop"]
