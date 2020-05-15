#!/bin/bash

result=1

for (( i = 1; i <= $1; ++i ))
do
  ((result *= i))
done

echo "Факториал числа $1 равен $result"
