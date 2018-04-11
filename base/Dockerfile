FROM debian:stretch-slim

MAINTAINER Tomohito Yabu "tyabu1212@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

ENV TZ Asia/Tokyo
ENV LANG_TO_SET ja_JP

RUN set -eux; \
  \
  apt-get update; apt-get upgrade -y; apt-get autoremove -y; \
  apt-get install -y --no-install-recommends \
    locales       \
    task-japanese \
  ; \
  \
  echo $TZ > /etc/timezone; \
  dpkg-reconfigure -f noninteractive tzdata; \
  \
  locale-gen ${LANG_TO_SET}.UTF-8; \
  localedef -f UTF-8 -i ${LANG_TO_SET} ${LANG_TO_SET}.utf8; \
  \
  apt-get clean; apt-get autoclean; \
  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

ENV LANG ${LANG_TO_SET}.UTF-8

RUN mkdir /workspace
WORKDIR /workspace
