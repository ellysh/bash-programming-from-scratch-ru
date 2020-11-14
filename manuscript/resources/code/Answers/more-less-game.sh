#!/bin/bash

number=$((RANDOM % 100 + 1))

for i in {1..7}
do
  echo "Введите число:"

  read input

  if (( input < number))
  then
    echo "Число $input меньше искомого"
  elif (( number < input))
  then
    echo "Число $input больше искомого"
  else
    echo "Вы отгадали число"
    exit 0
  fi
done

echo "Вы не отгадали число"
