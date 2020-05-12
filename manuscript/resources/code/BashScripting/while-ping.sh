#!/bin/bash

while ! ping -c 1 -W 1 google.com &> /dev/null
do
  sleep 1
done

echo "Сервер google.com доступен"

