#!/bin/bash
bsdtar -cjf ~/photo.tar.bz2 ~/photo && echo "bsdtar - OK" > results.txt || { echo "bsdtar - FAILS" > results.txt ; exit 1 ; }
cp -f ~/photo.tar.bz2 /d && echo "cp - OK" >> results.txt || ! echo "cp - FAILS" >> results.txt
