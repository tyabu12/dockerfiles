FROM tyabu/opam:2.0

LABEL maintainer="Tomohito Yabu <tyabu1212@gmail.com>" \
  coq_version="8.6.1"

ENV COQ_VERSION 8.6.1

RUN set -eux; \
  : "Set up"; \
  opam switch create 4.05.0; \
  eval "$(opam env)"; \
  opam repo add coq-released https://coq.inria.fr/opam/released; \
  opam update; \
  : "Install Coq"; \
  opam pin add -yv coq $COQ_VERSION; \
  : "Clean up"; \
  opam clean

CMD ["coqtop"]
