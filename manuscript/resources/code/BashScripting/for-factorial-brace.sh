#!/bin/bash

result=1

for i in {1..5}
do
  ((result *= $i))
done

echo "Факториал числа 5 равен $result"
