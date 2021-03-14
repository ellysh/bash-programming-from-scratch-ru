#!/bin/bash

print_error()
{
  declare -A messages

  messages["ru_RU",1]="Не найден файл"
  messages["ru_RU",2]="Нет прав для чтения файла"

  messages["en_US",1]="File not found:"
  messages["en_US",2]="Permission to read the file denied:"

  echo "${messages[$LANGUAGE,$1]} $2" >> debug.log
}

print_error 1 "readme.txt"
