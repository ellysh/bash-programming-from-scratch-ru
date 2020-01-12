#!/bin/bash
if ! bsdtar -cjf "$1".tar.bz2 "$@"
then
    echo "bsdtar - FAILS" > results.txt
    exit 1
fi

echo "bsdtar - OK" > results.txt

mv -f "$1".tar.bz2 /d && echo "cp - OK" >> results.txt || ! echo "cp - FAILS" >> results.txt
