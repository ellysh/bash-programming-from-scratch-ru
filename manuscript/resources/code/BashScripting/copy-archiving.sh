#!/bin/bash

operation="$1"

case "$operation" in
  "-a")
    find Documents -name "*.pdf" -type f -print0 | xargs -0 bsdtar -c -j -f documents.tar.bz2
    ;&

  "-c")
    cp documents.tar.bz2 ~/backup
    ;;

  *)
    echo "Указана недопустимая опция"
    exit 1
    ;;
esac
