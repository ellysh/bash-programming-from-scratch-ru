#!/bin/bash

result=1

for i in $(seq $1)
do
  ((result *= $i))
done

echo "Факториал числа $1 равен $result"
