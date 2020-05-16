#!/bin/bash

array=(Alice Bob Eve Mallory)

for element in "${array[@]}"
do
  if [[ "$element" == "$1" ]]
  then
    echo "Элемент со значением $1 есть в массиве"
    exit 0
  fi
done

echo "Элемента со значением $1 нет в массиве"
