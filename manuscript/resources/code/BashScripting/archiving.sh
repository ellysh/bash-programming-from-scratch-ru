#!/bin/bash

operation="$1"

if [[ "$operation" == "-a" ]]
then
  bsdtar -c -f documents.tar ~/Documents
elif [[ "$operation" == "-c" ]]
then
  bsdtar -c -j -f documents.tar.bz2 ~/Documents
elif [[ "$operation" == "-x" ]]
then
  bsdtar -x -f documents.tar*
else
  echo "Указана недопустимая опция"
  exit 1
fi
