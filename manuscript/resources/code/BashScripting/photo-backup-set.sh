#!/bin/bash
set -e
bsdtar -cjf ~/photo.tar.bz2 ~/photo && echo "bsdtar - OK" > results.txt || ! echo "bsdtar - FAILS" > results.txt
cp -f ~/photo.tar.bz2 /d && echo "cp - OK" >> results.txt || ! echo "cp - FAILS" >> results.txt
