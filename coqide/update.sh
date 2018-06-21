#!/bin/bash

set -eo pipefail

cd "$(dirname $0)"

versions=( "$@" )
if [ ${#versions[@]} -eq 0 ]; then
  versions=( */ )
fi
versions=( "${versions[@]%/}" )

SHA512SUMS=$TMPDIR/SHA512SUMS
wget -O $SHA512SUMS https://coq.inria.fr/distrib/SHA512SUMS

for version in "${versions[@]}"; do
  echo $version
  SHA512=$(grep -e "[^\\s]\+\\s\+V$version/files/coq-$version.tar.gz" $SHA512SUMS | cut -d' ' -f1)
  sed \
    -e 's!%%COQ_VERSION%%!'"$version"'!g' \
    -e 's!%%COQ_SHA512%%!'"$SHA512"'!g' \
    Dockerfile.template \
    > "$version/Dockerfile"
done
