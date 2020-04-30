#!/bin/bash

utility="$1"

case "$utility" in
  "b")
    bsdtar "${@:2}"
    ;;

  "t")
    tar "${@:2}"
    ;;

  *)
    echo "Указана недопустимая опция"
    ;;
esac
