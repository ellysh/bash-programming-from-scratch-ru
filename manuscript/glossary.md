# Список терминов

* [**Utility**](https://en.wikipedia.org/wiki/Utility_software) (утилита) — вспомогательная узкоспециализированная программа, предназначенная для обслуживания крупных информационных систем, например ОС.

* [**Portable Operating System Interface**](https://ru.wikipedia.org/wiki/POSIX) или POSIX (переносимый интерфейс операционных систем) — набор стандартов, которые описывают интерфейсы взаимодействия прикладных программ с ОС, командный интерпретатор и интерфейсы утилит. Цель создания POSIX — обеспечить совместимость ОС семейства Unix и облегчить перенос прикладных программ между ними.

## Параметры и переменные

* [**Argument**](http://linuxcommand.org/lc3_wss0120.php) (аргумент) — слово или строка, которые передаются в программу при её вызове из командного интерпретатора. Пример аргумента:
{line-numbers: false, format: Bash}
```
cat file.txt
```

* [**Option**](http://linuxcommand.org/lc3_wss0120.php) (опция) — тип аргумента в стандартизированной форме (начинается с `-` или `--`), который передаётся в программу командным интерпретатором. Используется для переключения режимов работы программы или перечисления аргументов в произвольном порядке. Несколько опций могут объединяться в группы. В следующем примере `-l`, `-a` и `-h` объединены:
{line-numbers: false, format: Bash}
```
ls -lah
```

* [**Parameter**](https://stackoverflow.com/a/36495940/6562278) — аргумент, который предоставляет информацию либо команде, либо одной из её опций. Например, путь начала поиска и имя искомого файла в команде `find`:
{line-numbers: false, format: Bash}
```
find ~/Documents -name README
```

* [**Shell Parameter**](http://mywiki.wooledge.org/BashGuide/Parameters) (параметр оболочки) — именованная область памяти интерпретатора, которая используется для хранения и извлечения информации.

* [**Positional Parameters**](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameters.html#Shell-Parameters) (позиционные параметры) — параметры, хранящие ключи и аргументы командной строки, которые были переданы Bash скрипту при вызове. Имеют строго определённый порядок, который соответствует порядку ключей и аргументов при вызове. Пример позиционного параметра:
{line-numbers: false, format: Bash}
```
cp "$1" ~
```

* [**Special Parameters**](http://mywiki.wooledge.org/BashGuide/Parameters) (специальные параметры) — параметры, устанавливаемые интерпретатором для хранения и передачи своих внутренних состояний. Доступны только для чтения. Пример специального параметра:
{line-numbers: false, format: Bash}
```
echo "$?"
```

* [**Variable**](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameters.html#Shell-Parameters) (переменная) — параметр, указанный по имени. Переменные задаются пользователем или интерпретатором. Пример объявления переменной:
{line-numbers: false, format: Bash}
```
FILENAME="README.txt"
```

* [**Shell Variable**](http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_03_02.html) (переменные интерпретатора) — переменные, которые устанавливаются интерпретатором. Они нужны для его корректной работы. Доступны пользователю для чтения и записи.

## Подстановки интерпретатора

* [**Arithmetic Expansion**](https://www.gnu.org/software/bash/manual/html_node/Arithmetic-Expansion.html#Arithmetic-Expansion) (арифметическая подстановка) — вычисление арифметического выражения и подстановка его результата. Пример:
{line-numbers: false, format: Bash}
```
echo $((4+3))
```

* [**Brace Expansion**](http://mywiki.wooledge.org/BraceExpansion) (подстановка фигурных скобок) — генерация слов из заданных частей. Является функцией Bash и отсутствует в стандарте POSIX. Следующие две команды эквивалентны:
{line-numbers: true, format: Bash}
```
cp test.{txt,md,log} Documents
cp test.txt test.md test.log Documents
```

* [**Command Substitution**](https://www.gnu.org/software/bash/manual/html_node/Command-Substitution.html#Command-Substitution) (подстановка команды) — подстановка вместо команды её вывода в stdout, полученного в результате исполнения. При этом команда исполняется в subshell. Пример:
{line-numbers: false, format: Bash}
```
echo "$(date)"
```

* [**Filename Expansion**](https://www.gnu.org/software/bash/manual/html_node/Filename-Expansion.html#Filename-Expansion) (подстановка имён файлов) — подстановка имён файлов вместо шаблонов, содержащих символы `?`, `*` и `[`. Пример:
{line-numbers: false, format: Bash}
```
rm -rf *
```

* [**Globbing**](https://mywiki.wooledge.org/glob?action=show&redirect=globbing) или glob — другое название для Filename Expansion.

* [**Parameter Expansion**](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html#Shell-Parameter-Expansion) (подстановка параметра) — подстановка вместо имени параметра его значения. Примеры:
{line-numbers: false, format: Bash}
```
echo "$PATH"
echo "${var:-empty}"
```

* [**Process Substitution**](https://www.gnu.org/software/bash/manual/html_node/Process-Substitution.html#Process-Substitution) (подстановка процесса) — аналог подстановки команды. В отличие от неё исполнение происходит асинхронно, а ввод и вывод команды привязаны к файлу. Содержимое этих файлов Bash перенаправляет родительскому процессу. Пример:
{line-numbers: false, format: Bash}
```
diff <(sort file1.txt) <(sort file2.txt)
```

* [**Quote Removal**](https://www.gnu.org/software/bash/manual/html_node/Quote-Removal.html#Quote-Removal) (удаление кавычек) — последняя из подстановок Bash. Заключается в удалении всех неэкранированных символов `\`, `'` и `"`, которые не были получены в результате одной из предыдущих подстановок.

* [**Tilde Expansion**](https://www.gnu.org/software/bash/manual/html_node/Tilde-Expansion.html#Tilde-Expansion) (подстановка тильды) — подстановка вместо символа тильда `~` домашнего каталога пользователя из переменной интерпретатора с именем `HOME`.

* [**Word Splitting**](https://www.gnu.org/software/bash/manual/html_node/Word-Splitting.html#Word-Splitting) (разделение слов) — механизм разделения строки аргументов на отдельные слова. В качестве разделителя используются символы, перечисленные в переменной `$IFS`. Аргументы, заключённые в кавычки не обрабатываются. Пример:
{line-numbers: false, format: Bash}
```
cp file1.txt file2.txt "my file.txt" ~
```