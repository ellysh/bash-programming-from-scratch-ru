#!/bin/bash

array=(Alice Bob Eve Mallory)
is_found="0"

for element in "${array[@]}"
do
  if [[ "$element" == "$1" ]]
  then
    is_found="1"
    break
  fi
done

if [[ "$is_found" -ne "0" ]]
then
  echo "Элемент со значением $1 есть в массиве"
else
  echo "Элемента со значением $1 нет в массиве"
fi
