#!/bin/bash

docker build -t tyabu/ocaml ./ocaml
docker build -t tyabu/opam  ./opam

find . -mindepth 2 -name Dockerfile | while read line
do
  line=$(echo $line | sed "s%/Dockerfile%%g")
  image=$(echo $line | cut -s -d'/' -f2)
  tag=$(echo $line | cut -s -d'/' -f3- | sed "s%/%-%g")
  if [ -z $tag ]; then
    tag="latest"
  fi
  docker build -t tyabu/$image:$tag $line
done
