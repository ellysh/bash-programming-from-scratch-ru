#!/bin/bash

print_error()
{
  declare -A messages

  messages["ru_RU",1]="Не найден файл"
  messages["ru_RU",2]="Нет прав для чтения файла"

  messages["en_US",1]="The following file was not found:"
  messages["en_US",2]="You do not have permissions to read the following file:"

  echo "${messages[$LANGUAGE,$1]} $2" >> debug.log
}

print_error 1 "readme.txt"
