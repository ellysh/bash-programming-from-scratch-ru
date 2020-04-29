#!/bin/bash

option="$1"
declare -A utils=(
  ["b"]="bsdtar"
  ["t"]="tar")

if [[ -z "$option" || ! -v utils["$option"] ]]
then
  echo "Указана недопустимая опция"
  exit 1
fi

${utils["$option"]} $2
