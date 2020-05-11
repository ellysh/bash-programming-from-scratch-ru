#!/bin/bash

find . -maxdepth 1 -print0 |
while IFS= read -r -d '' filename
do
  file "$filename"
done
