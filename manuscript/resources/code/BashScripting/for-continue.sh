#!/bin/bash

array=(1 25 -5 4 -9 3)
sum=0

for element in "${array[@]}"
do
  if (( element < 0))
  then
    continue
  fi

  ((sum += element))
done

echo "Сумма положительных чисел равна $sum"
