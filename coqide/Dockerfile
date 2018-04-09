FROM debian:jessie-slim
MAINTAINER tyabu1212@gmail.com

ENV VERSION "8.6"

RUN mkdir /workspace
WORKDIR /workspace

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get autoremove -y \
  && apt-get install -y \
    wget \
    ocaml \
    ocaml-native-compilers \
    ocaml-findlib \
    camlp5 \
    liblablgtk2-ocaml-dev \
    liblablgtksourceview2-ocaml-dev \
    libgtk2.0-dev \
    libocamlgraph-ocaml-dev

RUN cd /tmp \
  && wget https://coq.inria.fr/distrib/V$VERSION/files/coq-$VERSION.tar.gz \
  && tar zxvf coq-$VERSION.tar.gz \
  && rm -rf coq-$VERSION.tar.gz \
  && cd coq-$VERSION \
  && ./configure -prefix /usr/local \
  && make \
  && make install \
  && cd .. \
  && rm -rf coq-$VERSION

CMD ["coqide"]
