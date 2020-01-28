# Список терминов

## Параметры и переменные

* [**Argument**](http://linuxcommand.org/lc3_wss0120.php) (аргумент) — слово или строка, которые передаются в программу при её вызове из командного интерпретатора. Пример аргумента:
{line-numbers: false, format: Bash}
```
cat file.txt
```

* [**Option**](http://linuxcommand.org/lc3_wss0120.php) (ключ) — буква или слово в стандартизированной форме (начинается с `-` или `--`), которая передаётся в программу командным интерпретатором. Используются для переключения режимов работы программы или перечисления аргументов в произвольном порядке. Пример ключей:
{line-numbers: false, format: Bash}
```
ls -la
```

* [**Parameter**](http://mywiki.wooledge.org/BashGuide/Parameters) (параметр) — именованная область памяти, которая используется для хранения и извлечения информации.

* [**Positional Parameters**](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameters.html#Shell-Parameters) (позиционные параметры) — параметры, хранящие ключи и аргументы командной строки, которые были переданы Bash скрипту при вызове. Имеют строго определённый порядок, который соответствует порядку ключей и аргументов при вызове. Пример позиционного параметра:
{line-numbers: false, format: Bash}
```
cp "$1" ~
```

* [**Special parameters**](http://mywiki.wooledge.org/BashGuide/Parameters) (специальные параметры) — параметры, устанавливаемые интерпретатором для хранения и передачи своих внутренних состояний. Доступны только для чтения. Пример специального параметра:
{line-numbers: false, format: Bash}
```
echo "$?"
```

* [**Variable**](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameters.html#Shell-Parameters) (переменная) — параметр, указанный по имени. Переменные задаются пользователем или интерпретатором. Пример объявления переменной:
{line-numbers: false, format: Bash}
```
FILENAME="README.txt"
```

* [**Shell variable**](http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_03_02.html) (переменные интерпретатора) — переменные, которые устанавливаются интерпретатором. Они нужны для его корректной работы. Доступны пользователю для чтения и записи.

## Подстановки интерпретатора

* [**Brace Expansion**](http://mywiki.wooledge.org/BraceExpansion) (подстановка фигурных скобок) — генерация слов из заданных частей. Является функцией Bash и отсутствует в стандарте POSIX. Следующие две команды эквивалентны:
{line-numbers: true, format: Bash}
```
cp test.{txt,md,log} Documents
cp test.txt test.md test.log Documents
```

* [**Tilde Expansion**](https://www.gnu.org/software/bash/manual/html_node/Tilde-Expansion.html#Tilde-Expansion) (подстановка тильды) — подстановка вместо символа тильда `~` домашнего каталога пользователя из переменной интерпретатора с именем `HOME`.

// TODO:
• Shell Parameter Expansion:        How Bash expands variables to their values.
• Command Substitution:     Using the output of a command as an argument.
• Arithmetic Expansion:     How to use arithmetic in shell expansions.
• Process Substitution:     A way to write and read to and from a command.
• Word Splitting:       How the results of expansion are split into separate arguments.
• Filename Expansion:       A shorthand for specifying filenames matching patterns.
• Quote Removal:        How and when quote characters are removed from words. 