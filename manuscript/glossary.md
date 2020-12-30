# Список терминов

## А

[**Абстракция**](https://ru.wikipedia.org/wiki/Уровень_абстракции_(программирование)) ([abstraction](https://en.wikipedia.org/wiki/Abstraction_(computer_science))) — программный модуль, приложение или библиотека, которые повторяют основные свойства реального объекта. Абстракции помогают управлять сложностью программных систем. Они скрывают несущественные детали. Также они позволяют работать с разными объектами по одному алгоритму.

[**Алгоритм**](https://ru.wikipedia.org/wiki/Алгоритм) ([algorithm](https://en.wikipedia.org/wiki/Algorithm)) — это конечная последовательность инструкций, понятных исполнителю. Задача алгоритма — что-то вычислить или решить задачу.

**Аргумент** ([argument](http://linuxcommand.org/lc3_wss0120.php)) — слово или строка, которые передаются в программу через интерфейс командной строки. Пример аргументов:
{line-numbers: false, format: Bash}
```
grep "GNU" README.txt
```

**Асинхронность** ([asynchrony](https://en.wikipedia.org/wiki/Asynchrony_(computer_programming))) — означает события, происходящие независимо от основного потока выполнения программы. Так же под асинхронностью понимаются методы обработки таких событий.

## Б

[**Библиотека**](https://ru.wikipedia.org/wiki/Библиотека_(программирование)) ([library](https://en.wikipedia.org/wiki/Library_(computing))) — набор подпрограмм и объектов, собранных в самостоятельный модуль или файл. Приложения используют ресурсы библиотек как составные части.

## В

**Встроенные команды** ([builtin commands](https://www.gnu.org/software/bash/manual/html_node/Shell-Builtin-Commands.html)) — команды, которые интерпретатор исполняет самостоятельно. Для их выполнения не нужны сторонние утилиты. Пример встроенной команды - pwd.

[**Вычислительный процесс**](https://ru.wikipedia.org/wiki/Процесс_(информатика)) ([process](https://en.wikipedia.org/wiki/Process_(computing))) — экземпляр компьютерной программы, который исполняется процессором.

## Д

[**Дистрибутив Linux**](https://ru.wikipedia.org/wiki/Дистрибутив_Linux) ([**Linux distribution**](https://en.wikipedia.org/wiki/Linux_distribution)) — операционная система, основанная на ядре Linux и наборе [приложений GNU](https://ru.wikipedia.org/wiki/Список_пакетов_GNU). ОС собирается из пакетов с помощью пакетного менеджера. Она представляет собой набор готовых для работы программ и библиотек.

**Дочерний процесс** ([child process](https://en.wikipedia.org/wiki/Child_process)) — процесс, порождённый другим процессом (родительским).

## З

**Зарезервированные переменные** (reserved variable) — то же что и переменные оболочки (shell variables).

## И

[**Идиома**](https://ru.wikipedia.org/wiki/Идиома_(программирование)) ([idiom](https://en.wikipedia.org/wiki/Programming_idiom)) — способ выражения типовой конструкции в языке программирования. Идиома представляет собой шаблон реализации алгоритма или структуры данных на конкретном языке программирования. Вот идиома в Bash для обработки списка файлов в цикле for:
{line-numbers: true, format: Bash}
```
for file in ./*.txt
do
    cp "$file" ~/Documents
done
```

[**Интерпретатор**](https://ru.wikipedia.org/wiki/Интерпретатор) ([interpreter](https://en.wikipedia.org/wiki/Interpreter_(computing))) — программа, которая исполняет инструкции. Инструкции пишутся на языке программирования. Предварительная компиляция исходного кода для этого не требуется.

[**Итерация**](https://ru.wikipedia.org/wiki/Итерация_(программирование)) (iteration) — однократное исполнение команд в теле цикла.

## К

**Команда** (command) — текст, введённый после приглашения интерпретатора. Этот текст соответствует действию, которое интерпретатор выполняет самостоятельно или с помощью другого приложения.

[**Компилятор**](https://ru.wikipedia.org/wiki/Компилятор) ([compiler](https://en.wikipedia.org/wiki/Compiler)) — программа для перевода текста программы с языка программирования в машинный код.

[**Компьютерная программа**](https://ru.wikipedia.org/wiki/Компьютерная_программа) ([computer program](https://en.wikipedia.org/wiki/Computer_program)) — набор инструкций, которые может исполнить компьютер. Каждая программа решает прикладную задачу.

[**Конвейер**](https://ru.wikipedia.org/wiki/Конвейер_(Unix)) ([pipeline](https://en.wikipedia.org/wiki/Pipeline_(Unix))) — механизм взаимодействия процессов в Unix-подобных ОС. Он строится на передаче сообщений. Также конвейером называют два и более процесса со связанными потоками ввода-вывода. Поток вывода одного процесса передаётся напрямую в поток ввода другого и так далее.

## Л

[**Литерал**](https://ru.wikipedia.org/wiki/Литерал_(информатика)) ([literal](https://en.wikipedia.org/wiki/Literal_(computer_programming))) — условное обозначение в исходном коде программы. Оно представляет собой фиксированное значение. В зависимости от типа данных литералы записываются по-разному. Большинство языков программирования поддерживают литералы для целых чисел, [чисел с плавающей точкой](https://ru.wikipedia.org/wiki/Число_с_плавающей_запятой) и строк. Пример строкового литерала (`~/Documents`) в Bash:
{line-numbers: true, format: Bash}
```
var="~/Documents"
```

[**Логическое выражение**](https://ru.wikipedia.org/wiki/Логическое_выражение) ([Boolean expression](https://en.wikipedia.org/wiki/Boolean_expression)) — конструкция языка программирования. В результате её вычисления получается либо значение "истина", либо "ложь".

[**Логический оператор**](https://ru.wikipedia.org/wiki/Логическая_операция) ([logical operator](https://en.wikipedia.org/wiki/Logical_connective)) — операция над логическими выражениями. Она комбинирует их в одно выражение. Результат операции зависит от значений исходных выражений.

### М

[**Массив**](https://ru.wikipedia.org/wiki/Массив_(тип_данных)) ([array](https://en.wikipedia.org/wiki/Array_data_structure)) — структура данных, состоящая из набора элементов. Расположение каждого элемента определяет порядковый номер. В памяти компьютера элементы массива хранятся последовательно друг за другом.

[**Многозадачность**](https://ru.wikipedia.org/wiki/Многозадачность) ([multitasking](https://en.wikipedia.org/wiki/Computer_multitasking)) — параллельное выполнение нескольких задач (процессов) за определённый отрезок времени. Это достигается за счёт переключения компьютера ([переключение контекста](https://ru.wikipedia.org/wiki/Переключение_контекста)) между задачами и выполнения их по частям.

[**Мультипрограммирование**](https://ru.wikipedia.org/wiki/Мультипрограммирование) ([multiprogramming](https://www.geeksforgeeks.org/difference-between-multitasking-multithreading-and-multiprocessing/)) — распределение нагрузки компьютера между несколькими программами. Например, компьютер выполняет программу до тех пор, пока ей не потребуется некоторый ресурс. Если ресурс занят, программа останавливается. Компьютер переключается на другую программу. Он вернётся к выполнению первой программы, когда нужный ей ресурс освободится. 

## О

[**Область видимости**](https://ru.wikipedia.org/wiki/Область_видимости) ([scope block](https://en.wikipedia.org/wiki/Scope_(computer_science))) — часть программы или системы, в которой имя переменной остаётся связанным с её значением. Другими словами имя переменной корректно конвертируется в адрес памяти, по которому хранится её значение. За пределами области видимости то же имя может указывать на другую область памяти.

[**Операнд**](https://ru.wikipedia.org/wiki/Операнд) ([operand](https://en.wikipedia.org/wiki/Operand)) — аргумент математической операции или команды. Он представляет собой данные для обработки. Например, в следующей операции сложения операнды — это числа 1 и 4:
{line-numbers: false, format: Bash}
```
1 + 4
```

**Оператор перенаправления** ([redirection operator](https://www.gnu.org/software/bash/manual/html_node/Redirections.html#Redirections)) — специальная конструкция языков Bash и Bourne shell, которая перенаправляет потоки ввода-вывода для встроенных команд, утилит и приложений. Как источник и цель перенаправления указываются файловые дескрипторы. Они связаны с файлами или стандартными потоками. Пример перенаправления вывода утилиты find в файл `result.txt`:
{line-numbers: false, format: Bash}
```
find / -path */doc/* -name README 1> result.txt
```

**Опции интерпретатора** ([shell options](https://www.tldp.org/LDP/abs/html/options.html)) — настройки, которые меняют поведение интерпретатора в режимах оболочки и исполнения скриптов. Настройки задаются встроенной командой set. Например, вот команда включения отладочного вывода интерпретатора:
{line-numbers: false, format: Bash}
```
set -x
```

**Опция** ([**option**](http://linuxcommand.org/lc3_wss0120.php)) — аргумент в стандартизированной форме, который передаётся в программу. Опция начинается с тире - или двойного тире --.  Она переключает режим работы программы. Следующие друг за другом опции можно объединить в одну группу. Вот пример объединения опций `-l`, `-a` и `-h` утилиты ls:
{line-numbers: false, format: Bash}
```
ls -lah
```

## П

[**Парадигма программирования**](https://ru.wikipedia.org/wiki/Парадигма_программирования) ([programming paradigm](https://en.wikipedia.org/wiki/Programming_paradigm)) — это набор идей, методов и принципов, которые определяют способ написания программ.

**Параметр** ([parameter](http://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Parameters)) — сущность, которая хранит какое-то значение. Параметр в отличие от переменной может не иметь имени.

**Параметр интерпретатора** ([shell parameter](http://mywiki.wooledge.org/BashGuide/Parameters)) — именованная область памяти интерпретатора для хранения данных.

**Параметр командной строки** ([command line parameter](https://stackoverflow.com/a/36495940/6562278)) — вид аргумента команды. Он передаёт информацию в программу. Параметр также может быть часть опции. Например, чтобы указать выбранный режим работы.
Вот команда вызова утилиты find:
{line-numbers: false, format: Bash}
```
find ~/Documents -name README
```
Её первый параметр `~/Documents` сообщает путь начала поиска. Второй параметр `README` относится к опции `-name`.

[**Переменная**](https://ru.wikipedia.org/wiki/Переменная_(программирование)) ([variable](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameters.html#Shell-Parameters)) — 1) это область памяти, обращаться к которой можно по имени.
2) в Bash это параметр, доступный по имени. Переменные задаются пользователем или интерпретатором. Пример объявления переменной:
{line-numbers: false, format: Bash}
```
filename="README.txt"
```

**Переменные оболочки** ([shell variables](http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_03_02.html)) — переменные, которые устанавливает интерпретатор. В них хранятся временные данные, настройки и состояния ОС или Unix-окружения. Пользователь может читать значения переменных окружения. Для записи доступны только некоторые из них. Выводятся командой set. Пример — переменная `PATH`.

**Переменные окружения** ([environment variables](http://mywiki.wooledge.org/Environment)) — неупорядоченный набор переменных, который копируется из родительского процесса в дочерний. Утилита env изменяет переменные окружения при запуске программы. При вызове её без параметров, она выводит переменные, объявленные в текущем командном интерпретаторе.

[**Подпрограмма**](https://ru.wikipedia.org/wiki/Подпрограмма) ([subroutine](https://en.wikipedia.org/wiki/Subroutine)) — фрагмент программы, который выполняет одну задачу. Фрагмент выделяется в самостоятельный блок кода. Его можно вызвать из любого места программы.

**Позиционные параметры** ([positional parameters](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameters.html#Shell-Parameters)) — параметры со всеми аргументы командной строки, которые Bash-скрипт получил при вызове. Имена параметров соответствуют порядку аргументов. Пример использования позиционного параметра в скрипте:
{line-numbers: false, format: Bash}
```
cp "$1" ~
```

[**Порядок выполнения**](https://ru.wikipedia.org/wiki/Порядок_выполнения) ([control flow](https://en.wikipedia.org/wiki/Control_flow)) — порядок выполнения инструкций программы и вызова функций в процессе её работы.

**Приглашение командной строки** ([prompt](https://www.gnu.org/software/bash/manual/html_node/Controlling-the-Prompt.html#Controlling-the-Prompt)) — это последовательность символов. Командный интерпретатор выводит её, когда готов обработать следующую команду пользователя.

## Р

[**Разделение времени**](https://ru.wikipedia.org/wiki/Разделение_времени) ([time-sharing](https://en.wikipedia.org/wiki/Time-sharing)) — использование ресурсов компьютера несколькими пользователями одновременно. Достигается за счёт многозадачности и мультипрограммирования.

[**Расширение файла**](https://ru.wikipedia.org/wiki/Расширение_имени_файла) (filename extension) — часть имени файла. Добавляется в конец имени через точку. Расширение определяет тип файла.

[**Рекурсия**](https://ru.wikipedia.org/wiki/Рекурсия#В_программировании) ([recursion](https://en.wikipedia.org/wiki/Recursion_(computer_science))) — вызов функции из неё же самой (простая рекурсия) или через другие функции (косвенная рекурсия).

## С

[**Связанный список**](https://ru.wikipedia.org/wiki/Связный_список) ([linked list](https://en.wikipedia.org/wiki/Linked_list)) — структура данных, состоящая из элементов или узлов. Порядок их размещения в списке не совпадает с порядком следования в памяти. Поэтому каждый узел содержит данные и адрес памяти следующего узла. Такая организация списка делает эффективными операции вставки и удаления.

[**Сетевой протокол**](https://ru.wikipedia.org/wiki/Протокол_передачи_данных) ([communication protocol](https://en.wikipedia.org/wiki/Communication_protocol)) — соглашение о формате сообщений между узлами компьютерной сети.

[**Символьная ссылка**](https://ru.wikipedia.org/wiki/Символическая_ссылка) ([symbolic link](https://en.wikipedia.org/wiki/Symbolic_link)) — файл специального типа. Вместо данных он содержит указатель на другой файл или каталог.

**Синхронный** ([synchronous](https://en.wiktionary.org/wiki/synchronous)) — обозначает события или действия, которые происходят в одном потоке выполнения программы.

**Специальные параметры** ([special parameters](http://mywiki.wooledge.org/BashGuide/Parameters)) — устанавливаются интерпретатором для хранения своего состояния, передачи параметров в вызываемые приложения (позиционные параметры) и чтения их кода возврата. Специальные параметры доступны только для чтения. Пример такого параметра — `$?`.

[**Стандартные потоки**](https://ru.wikipedia.org/wiki/Стандартные_потоки) ([standard streams](https://en.wikipedia.org/wiki/Standard_streams)) — программные каналы коммуникации приложения с окружением, в котором оно работает. Потоки — это абстракции физических каналов ввода с клавиатуры и вывода на экран монитора. Обращение к каналу происходит по дескриптору, который назначается ОС.

## У

[**Управляющая последовательность**](https://ru.wikipedia.org/wiki/Управляющая_последовательность) ([escape sequence](https://en.wikipedia.org/wiki/Escape_sequence)) — набор символов, которые не имеют собственного значения. Вместо этого они управляют устройством вывода. Например, символ перевода строки `\n` даёт команду устройству вывода начать новую строку.

[**Управляющие символы**](https://ru.wikipedia.org/wiki/Управляющие_символы) — другое название для управляющей последовательности.

[**Условный оператор**](https://ru.wikipedia.org/wiki/Ветвление_(программирование)) ([conditional statement](https://en.wikipedia.org/wiki/Conditional_(computer_programming)) или conditional expression) — конструкция языка программирования. Она выбирает набор команд для выполнения в зависимости от значения логического выражения.

[**Утилита**](https://ru.wikipedia.org/wiki/Утилита) ([utility software](https://en.wikipedia.org/wiki/Utility_software)) — вспомогательная программа для работы с ОС или оборудованием.

[**Уязвимость**](https://ru.wikipedia.org/wiki/Уязвимость_(компьютерная_безопасность)) ([vulnerability](https://en.wikipedia.org/wiki/Vulnerability_(computing))) — ошибка или недостаток в системе. Используя уязвимость, можно выполнить несанкционированные действия.

## Ф

[**Файловый дескриптор**](https://ru.wikipedia.org/wiki/Файловый_дескриптор) ([file descriptor](https://en.wikipedia.org/wiki/File_descriptor)) — абстрактный указатель на файл или канал коммуникации (поток, конвейер или сетевой сокет). Дескрипторы являются частью POSIX-интерфейса. Они представляют собой целые неотрицательные числа.

[**Файловая система**](https://ru.wikipedia.org/wiki/Файловая_система) ([file system](https://en.wikipedia.org/wiki/File_system)) — способ хранения и чтения данных с носителей информации.

[**Функция**](https://ru.wikipedia.org/wiki/Функция_(программирование)) (function) — другое название для подпрограммы.

## Х

[**Xеш-таблица**](https://ru.wikipedia.org/wiki/Хеш-таблица) ([hash table](https://en.wikipedia.org/wiki/Hash_table)) — структура данных. Каждый её элемент — это пара ключ-значение (key-value). Говорят, что хеш-таблица отображает ключи на значения. Роль ключей напоминает индексы элементов в массиве. Ключи рассчитываются [хеш-функцией](https://ru.wikipedia.org/wiki/Хеш-функция). 

[**Хеш-функция**](https://ru.wikipedia.org/wiki/Хеш-функция) ([hash function](https://en.wikipedia.org/wiki/Hash_function)) — функция для генерации уникальной последовательности байтов из переданных на вход данных.

## Ш

[**Шаблон поиска**](https://ru.wikipedia.org/wiki/Шаблон_поиска) ([glob](https://en.wikipedia.org/wiki/Glob_(programming))) — поисковый запрос. Вместе с обычными символами в него входят [символы подстановки](https://ru.wikipedia.org/wiki/Символ_подстановки): * и ?. Символы подстановки соответствуют любым символам. Например, шаблон `R*M?`. Он соответствует строкам, которые начинаются с R и предпоследняя буква которых M.

[**Шебанг**](https://ru.wikipedia.org/wiki/Шебанг_(Unix)) ([shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)) — последовательность из символов решётки и восклицательного знака #! в начале скрипта. Загрузчик программ рассматривает строку после шебанг как имя интерпретатора. Дальше загрузчик запускает интерпретатор и передаёт ему скрипт на выполнение. Пример шебанг для Bash-скриптов:
{line-numbers: true, format: Bash}
```
#!/bin/bash
```

## Я

**Язык программирования общего назначения** ([general-purpose programming language](https://en.wikipedia.org/wiki/General-purpose_programming_language)) — язык, на котором можно разрабатывать приложения для разных прикладных областей. В нём нет конструкций, полезных для одной области и бесполезных в других.

## A

[**alias**](https://www.gnu.org/software/bash/manual/html_node/Aliases.html#Aliases) (псевдоним) — встроенная команда Bash для сокращения длинных строк. Применяется в режиме командного интерпретатора.

[**Application Programming Interface**](https://en.wikipedia.org/wiki/Application_programming_interface) или API ([интерфейс прикладного программирования](https://ru.wikipedia.org/wiki/API)) — набор соглашений о взаимодействии компонентов информационной системы. Соглашения отвечают на следующие вопросы:
* Какую функцию выполнит вызываемый компонент?
* Какие данные передать на вход функции?
* Какие данные функция возвращает?
 
[**Arithmetic Expansion**](https://www.gnu.org/software/bash/manual/html_node/Arithmetic-Expansion.html#Arithmetic-Expansion) (арифметическая подстановка) — в Bash вычисление арифметического выражения и подстановка его результата. Например:
{line-numbers: false, format: Bash}
```
echo $((4+3))
```

[**ASCII-кодировка**](https://ru.wikipedia.org/wiki/ASCII) — восьмибитная система кодировки символов. Включает в себя:
* десятичные цифры
* латинский алфавит
* национальный алфавит
* знаки препинания
* управляющие символы

## B

[**Background**](https://www.gnu.org/software/bash/manual/html_node/Job-Control-Basics.html#Job-Control-Basics) (фоновый режим) — в Bash режим исполнения процесса. В этом режиме его идентификатор не относится к [группе идентификаторов](https://en.wikipedia.org/wiki/Process_group) процесса терминала. Исполняемый процесс не обрабатывает прерывания клавиатуры.

[**Bash**](https://en.wikipedia.org/wiki/Bash_(Unix_shell)) (Bourne again shell) — интерпретатор командной строки, разработанный Брайаном Фоксом. Bash заменил интерпретатор Bourne shell в Linux-дистрибутивах и некоторых проприетарных Unix-системах. Bash совместим с POSIX-стандартом. Некоторые его расширения стандартом не предусмотрены.

**Bash-скрипт** ([**Bash script**](https://www.gnu.org/software/bash/manual/html_node/Shell-Scripts.html#Shell-Scripts)) — текстовый файл, содержащий команды интерпретатора. Bash исполняет скрипты в не интерактивном режиме.

[**Best Practices**](http://mywiki.wooledge.org/BashGuide/Practices) (хорошая практика) — рекомендованные приемы использования языка программирования или какой-то технологии. Пример для языка Bash — заключение строк в двойные кавычки, чтобы избежать word splitting.

[**Bottleneck**](https://en.wikipedia.org/wiki/Bottleneck_(software)) (букв. бутылочное горло, узкое место) — компонент или ресурс информационной системы, который ограничивает её производительность или пропускную способность.

[**Bourne shell**](https://en.wikipedia.org/wiki/Bourne_shell) — интерпретатор командной строки, разработанный Стивеном Борном. Он заменил оригинальный [интерпретатор Кена Томпсона](https://en.wikipedia.org/wiki/Thompson_shell) в [Unix версии 7](https://en.wikipedia.org/wiki/Version_7_Unix). Все функции Bourne shell соответствуют [POSIX-стандарту](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html). Но некоторые упомянутые в стандарте возможности отсутствуют.

[**Brace Expansion**](http://mywiki.wooledge.org/BraceExpansion) (подстановка фигурных скобок) — в Bash генерация слов из заданных частей. Эта функция отсутствует в стандарте POSIX. Например, следующие две команды эквивалентны:
{line-numbers: true, format: Bash}
```
cp test.{txt,md,log} Documents
cp test.txt test.md test.log Documents
```

## C

[**Coding Style**](https://en.wikipedia.org/wiki/Programming_style) ([стандарт оформления кода](https://ru.wikipedia.org/wiki/Стандарт_оформления_кода)) — набор правил и соглашений для написания исходного кода программ. Задача стандарта — помочь нескольким программистам писать, читать и понимать общий исходный код.

[**Command Substitution**](https://www.gnu.org/software/bash/manual/html_node/Command-Substitution.html#Command-Substitution) (подстановка команды) — подстановка вместо команды её вывода в stdout. Вывод получается после исполнения команды в subshell. Пример:
{line-numbers: false, format: Bash}
```
echo "$(date)"
```

## E

[**Endianness**](https://en.wikipedia.org/wiki/Endianness) ([порядок байтов](https://ru.wikipedia.org/wiki/Порядок_байтов)) — порядок байтов при хранении чисел в памяти компьютера. Он определяется свойствами центрального процессора. Сегодня используются порядки от старшего к младшему (big-endian) и от младшего к старшему (little-endian). Некоторые CPU поддерживают оба варианта (bi-endian). Переключение между ними происходит при запуске компьютера. Пример хранения четырёхбайтового числа 0x0A0B0C0D для разных порядков:
{line-numbers: false, format: Bash}
```
0A 0B 0C 0D     big-endian
0D 0C 0B 0A     little-endian
```

[**Error-prone**](https://en.wiktionary.org/wiki/error-prone) (подверженный ошибкам) — обозначение приёмов программирования и решений. Эти решения работают корректно в частных случаях, но приводят к ошибкам при определённых входных данных или условиях. Пример error-prone решения — обработка вывода утилиты ls в конвейере:
{line-numbers: false, format: Bash}
```
ls | grep "test"
```

[**Exit Status**](https://www.gnu.org/software/bash/manual/html_node/Exit-Status.html#Exit-Status) ([код возврата](https://ru.wikipedia.org/wiki/Код_возврата)) — в Bash целочисленное значение от 0 до 255, которое команда возвращает интерпретатору при завершении. Код возврата 0 означает успешное выполнение команды. Все остальные коды указывают на ошибку.

## F

[**Filename Expansion**](https://www.gnu.org/software/bash/manual/html_node/Filename-Expansion.html#Filename-Expansion) (подстановка имён файлов) — в Bash подстановка имён файлов вместо шаблонов, содержащих символы ?, * и [. Пример:
{line-numbers: false, format: Bash}
```
rm -rf *
```

[**Foreground**](https://www.gnu.org/software/bash/manual/html_node/Job-Control-Basics.html#Job-Control-Basics) (активный режим) — в Bash режим исполнения процесса. При этом его идентификатор относится к [группе идентификаторов](https://en.wikipedia.org/wiki/Process_group) процесса терминала. Исполняемый процесс обрабатывает прерывания клавиатуры.

## G

[**Globbing**](https://mywiki.wooledge.org/glob?action=show&redirect=globbing) или glob — в Bash другое название для filename expansion.

## I

[**Input Field Separator**](https://mywiki.wooledge.org/IFS) или IFS (разделитель поля ввода) — список следующих друг за другом символов. Bash использует их как разделители при обработке вводимых строк (в том числе и для word splitting). По умолчанию это символы пробела, табуляции и перевода строки.

## L

**Linux-окружение** (Linux Environment) — другое название для POSIX-окружения.

## P

[**Parameter Expansion**](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html#Shell-Parameter-Expansion) (подстановка параметров или подстановка переменных) — в Bash подстановка вместо имени переменной или параметра его значения. Примеры:
{line-numbers: false, format: Bash}
```
echo "$PATH"
echo "${var:-empty}"
```

[**Portable Operating System Interface**](https://ru.wikipedia.org/wiki/POSIX) или POSIX (переносимый интерфейс операционных систем) — набор стандартов. Они описывают интерфейсы взаимодействия прикладных программ с ОС, командный интерпретатор и интерфейсы утилит. POSIX поддерживает совместимость ОС семейства Unix. Благодаря этому, между ними легче переносить прикладные программы.

**POSIX-окружение** (POSIX environment) — программная среда полностью или частично совместимая со стандартом POSIX. Для полной совместимости нужна поддержка ядром ОС, командной оболочкой и файловой системой. Для частичной совместимости достаточно окружения наподобие [Cygwin](https://ru.wikipedia.org/wiki/Cygwin).

[**POSIX Shell**](https://www.grymoire.com/Unix/Sh.html) — стандарт для POSIX-систем с описанием минимального набора функций командного интерпретатора. Если интерпретатор имеет эти функции, он считается POSIX-совместимым. При этом стандарт никак не ограничивает дополнительные возможности и расширения. В основу стандарта легла реализация ksh88 [Korn shell](https://en.wikipedia.org/wiki/KornShell). Этот интерпретатор появился позже, чем Bourne shell. Поэтому некоторые функции стандарта POSIX отсутствуют в Bourne shell.

[**Process Substitution**](https://www.gnu.org/software/bash/manual/html_node/Process-Substitution.html#Process-Substitution) (подстановка процесса) — в Bash аналог подстановки команды. В отличие от неё исполнение происходит асинхронно. При этом ввод и вывод команды привязаны к файлам. Содержимое этих файлов Bash перенаправляет родительскому процессу. Пример:
{line-numbers: false, format: Bash}
```
diff <(sort file1.txt) <(sort file2.txt)
```

## Q

[**Quote Removal**](https://www.gnu.org/software/bash/manual/html_node/Quote-Removal.html#Quote-Removal) (удаление кавычек) — подстановка, которую Bash выполняет последней. Она удаляет неэкранированные символы \, ' и ", которые не были получены в результате предыдущих подстановок.

## S

[**Short-circuit evaluation**](https://en.wikipedia.org/wiki/Short-circuit_evaluation) (короткое замыкание) — вычисление только тех операндов логического оператора, которые достаточны для вывода значения всего выражения.

[**Subshell**](http://mywiki.wooledge.org/SubShell) (подоболочка) — способ группирования команд. Команды исполняются в интерпретаторе, запущенном в дочернем процессе. Переменные, определённые в дочернем процессе, не доступны в родительском. Пример выполнения команд в subshell:
{line-numbers: false, format: Bash}
```
(ps aux | grep "bash")
```

## T

[**Tilde Expansion**](https://www.gnu.org/software/bash/manual/html_node/Tilde-Expansion.html#Tilde-Expansion) (подстановка тильды) — в Bash подстановка вместо символа тильда ~ домашнего каталога пользователя. Путь до домашнего каталога читается из переменной `HOME`.

## U

**Unix-окружение** ([Unix environment](https://ccrma.stanford.edu/guides/planetccrma/Unix.html)) — другое название для POSIX-окружения.

## W

[**Word Splitting**](https://www.gnu.org/software/bash/manual/html_node/Word-Splitting.html#Word-Splitting) (разделение слов) — в Bash разделение аргументов командной строки на слова и передача их отдельными параметрами. Символы из переменной `$IFS` используются как разделители. Аргументы, заключённые в кавычки, не обрабатываются. Пример:
{line-numbers: false, format: Bash}
```
cp file1.txt file2.txt "my file.txt" ~
```