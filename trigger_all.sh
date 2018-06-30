#!/bin/bash

set -u

declare -A arr=(
  [ocaml]="$OCAML_TRIGGER_TOKEN"
  [debian]="$DEBIAN_TRIGGER_TOKEN"
  [coq]="$COQ_TRIGGER_TOKEN"
  [coqide]="$COQIDE_TRIGGER_TOKEN"
  [eliom]="$ELIOM_TRIGGER_TOKEN"
)

for key in ${!arr[*]} ; do
  name=$key
  token=${arr[$key]}
  curl -H 'Content-Type: application/json' --data '{"build": true}' -X POST https://registry.hub.docker.com/u/tyabu/$name/trigger/$token/
done

