# Список терминов

## Параметры и переменные

* [**Argument**](http://linuxcommand.org/lc3_wss0120.php) (аргумент) - слово или строка, которые передаются в программу при её вызове из командного интерпретатора. Пример аргумента:
{line-numbers: false, format: Bash}
```
cat file.txt
```

* [**Option**](http://linuxcommand.org/lc3_wss0120.php) (ключ) - буква или слово в стандартизированной форме (начинается с `-` или `--`), которая передаётся в программу командным интерпретатором. Используются для переключения режимов работы программы или перечисления аргументов в произвольном порядке. Пример ключей:
{line-numbers: false, format: Bash}
```
ls -la
```

* [**Parameter**](http://mywiki.wooledge.org/BashGuide/Parameters) (параметр) - именованная область памяти, которая используется для хранения и извлечения информации.

* [**Variable**](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameters.html#Shell-Parameters) (переменная) - параметр, указанный по имени. Переменные задаются пользователем. Пример объявления переменной:
{line-numbers: false, format: Bash}
```
FILENAME="README.txt"
```

* [**Special parameters**](http://mywiki.wooledge.org/BashGuide/Parameters) (специальные параметры) - параметры, устанавливаемые интерпретатором для хранения и передачи своих внутренних состояний. Доступны только для чтения. Пример специального параметра:
{line-numbers: false, format: Bash}
```
echo "$?"
```

* [**Positional Parameters**](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameters.html#Shell-Parameters) (позиционные параметры) - параметры, хранящие ключи и аргументы командной строки, которые были переданы Bash скрипту при вызове. Имеют строго определённый порядок, который соответствует порядку ключей и аргументов при вызове. Пример позиционного параметра:
{line-numbers: false, format: Bash}
```
cp "$1" ~
```

## Подстановки интерпретатора