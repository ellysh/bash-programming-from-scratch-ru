#!/bin/bash

cd dir1
find . -type f -exec test ! -e ../dir2/{} \; -a -exec echo {} \;

cd ../dir2
find . -type f -exec test ! -e ../dir1/{} \; -a -exec echo {} \;
