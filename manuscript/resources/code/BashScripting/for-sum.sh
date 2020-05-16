#!/bin/bash

array=(1 25 -5 4 -9 3)
sum=0

for element in "${array[@]}"
do
  if (( 0 < element ))
  then
    ((sum += element))
  fi
done

echo "Сумма положительных чисел равна $sum"
