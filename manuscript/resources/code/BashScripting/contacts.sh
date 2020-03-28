#!/bin/bash

declare -A contacts=(
  ["Alice"]="alice@gmail.com"
  ["Bob"]="(697) 955-5984"
  ["Eve"]="(245) 317-0117"
  ["Mallory"]="mallory@hotmail.com")

echo "${contacts["$1"]}"
