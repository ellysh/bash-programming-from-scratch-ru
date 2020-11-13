#!/bin/bash

find . -maxdepth 1 -type f -name "*.txt" -exec "${1:-cp}" -t ~ {} \;
