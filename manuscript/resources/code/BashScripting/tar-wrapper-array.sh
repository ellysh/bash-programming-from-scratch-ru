#!/bin/bash

declare -A utils=(
  ["b"]="bsdtar"
  ["t"]="tar")

${utils["$1"]} $2
