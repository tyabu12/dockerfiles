#!/bin/sh
set -e

eval `opam env`

exec "$@"
