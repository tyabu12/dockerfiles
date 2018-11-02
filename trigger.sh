#!/bin/bash

set -u

name=$1
token=$2

curl -H 'Content-Type: application/json' --data '{"build": true}' \
  -X POST https://registry.hub.docker.com/u/tyabu/$name/trigger/$token/

