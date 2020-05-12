#!/bin/bash

IFS=$','
for path in $1
do
  echo "$path"
done
