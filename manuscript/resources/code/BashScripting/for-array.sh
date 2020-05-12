#!/bin/bash

array=(Alice Bob Eve Mallory)

for element in "${array[@]}"
do
    echo "$element"
done
