#!/bin/bash

declare -A array

while IFS=$'=' read -r name contact
do
  array[$name]=$contact
done < "contacts.txt"

echo "${array["$1"]}"
