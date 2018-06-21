#/bin/bash

find . -maxdepth 1 -type d -name "[a-zA-Z]*" | awk '{print substr($0, 3)}' | while read dir
do
  docker build -t tyabu/$dir $dir
done
