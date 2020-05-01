#!/bin/bash

option="$1"

declare -A utils=(
  ["-b"]="bsdtar"
  ["--bsdtar"]="bsdtar"
  ["-t"]="tar"
  ["--tar"]="tar")

if [[ -z "$option" || ! -v utils["$option"] ]]
then
  echo "Указана недопустимая опция"
  exit 1
fi

${utils["$option"]} "${@:2}"
