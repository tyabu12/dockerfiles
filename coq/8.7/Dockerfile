FROM tyabu/opam:2.0

LABEL maintainer="Tomohito Yabu <tyabu1212@gmail.com>" \
  coq_version="8.7.2"

ENV COQ_VERSION 8.7.2

RUN set -eux; \
  : "Set up"; \
  eval "$(opam env)"; \
  opam repo add coq-released https://coq.inria.fr/opam/released; \
  opam update; \
  : "Install Coq"; \
  opam pin add -yv coq $COQ_VERSION; \
  : "Clean up"; \
  opam clean

CMD ["coqtop"]
