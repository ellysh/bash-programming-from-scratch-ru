#!/bin/bash

code_to_error()
{
  case $1 in
    1)
      echo "Не найден файл"
      ;;
    2)
      echo "Нет прав для чтения файла"
      ;;
  esac
}

print_error()
{
  echo "$(code_to_error $1) $2" >> debug.log
}

print_error 1 "readme.txt"
