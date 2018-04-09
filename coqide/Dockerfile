FROM debian:jessie-slim
MAINTAINER tyabu1212@gmail.com

ENV LANG      ja_JP.UTF-8
ENV LC_CTYPE  ja_JP.UTF-8

ENV VERSION "8.6"

RUN mkdir /workspace
WORKDIR /workspace

RUN apt-get install locales \
  && locale-gen ja_JP.UTF-8 \
  && localedef -f UTF-8 -i ja_JP ja_JP.utf8

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
