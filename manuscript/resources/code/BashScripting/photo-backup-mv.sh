#!/bin/bash

bsdtar -cjf "$1".tar.bz2 "$1" &&
  echo "bsdtar - OK" > results.txt ||
  { echo "bsdtar - FAILS" > results.txt ; exit 1 ; }

mv -f "$1".tar.bz2 /d &&
  echo "cp - OK" >> results.txt ||
  ! echo "cp - FAILS" >> results.txt
