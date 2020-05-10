#!/bin/bash

while IFS= read -r -d '' filename
do
  file "$filename"
done < <(find . -maxdepth 1 -print0)

