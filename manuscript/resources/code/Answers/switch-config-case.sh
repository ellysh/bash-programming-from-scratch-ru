#!/bin/bash

file="$1"

rm ~/.bashrc

case "$file" in
  "h")
    ln -s ~/.bashrc-home ~/.bashrc
    ;;

  "w")
    ln -s ~/.bashrc-work ~/.bashrc
    ;;

  *)
    echo "Указана недопустимая опция"
    ;;
esac
