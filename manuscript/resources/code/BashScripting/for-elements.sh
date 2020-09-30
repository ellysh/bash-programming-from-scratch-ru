#!/bin/bash

array=(Alice Bob Eve Mallory)

for element in "${array[@]:0:2}"
do
    echo "$element"
done
