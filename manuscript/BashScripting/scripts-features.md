## Зачем нужны скрипты?

В прошлой главе мы научились писать сложные Bash-команды с использованием конвейеров и логических операторов. Конвейеры объединяют несколько команд в одну. Так получается линейный алгоритм. Логические операторы добавляют в него ветвление. В результате получается настоящая программа.

Почему для программирования на Bash средств командного интерпретатора оказывается недостаточно? Bash-скрипты — это программы, хранящиеся на жёстком диске. Разберёмся, зачем они нужны.

### Команда резервного копирования

Для примера напишем команду резервного копирования фотографий на [внешний жёсткий диск](https://ru.wikipedia.org/wiki/Внешний_жёсткий_диск). Команда будет состоять из двух действий: архивирования и копирования. Предположим, что фотографии хранятся в каталоге `~/photo`, а `/d` — это точка монтирования внешнего диска. Тогда команда может быть такой:
{line-numbers: false, format: Bash}
```
bsdtar -cjf ~/photo.tar.bz2 ~/photo && cp -f ~/photo.tar.bz2 /d
```

Благодаря логическому И (&&), копирование выполняется только после успешного архивирования. Если утилита bsdtar вернула ошибку, копирования не будет.

I> В нашем примере резервное копирование выполняется в два этапа: архивирование и копирование. Такое разделение действий нужно для демонстрации. То же самое поведение даст один вызов утилиты bsdtar. Укажите в нём путь до создаваемого архива на диске D. Например, так:
{line-numbers: false, format: Bash}
```
bsdtar -cjf /d/photo.tar.bz2 ~/photo
```

Предположим, что наша команда резервного копирования будет запускаться автоматически (например, по расписанию). Тогда вы не сможете прочитать сообщение об ошибке, если что-то пойдёт не так. В таких случаях поможет вывод в лог-файл. Добавим этот вывод для вызова утилиты bsdtar. Получим:
{line-numbers: true, format: Bash}
```
bsdtar -cjf ~/photo.tar.bz2 ~/photo &&
echo "bsdtar - OK" > results.txt ||
echo "bsdtar - FAILS" > results.txt
```

Bash-команду можно разбить на несколько строк. Есть два способа переноса строк:

1. Перенос строки сразу после логического оператора (&& или ||).

2. Перенос строки после обратного слеша \. 

Второй вариант выглядит так:
{line-numbers: true, format: Bash}
```
bsdtar -cjf ~/photo.tar.bz2 ~/photo \
&& echo "bsdtar - OK" > results.txt \
|| echo "bsdtar - FAILS" > results.txt
```

Теперь выведем в лог-файл результат утилиты cp. Получим:
{line-numbers: true, format: Bash}
```
cp -f ~/photo.tar.bz2 /d &&
echo "cp - OK" >> results.txt ||
echo "cp - FAILS" >> results.txt
```

Резервное копирование должно выполняться одной командой. Поэтому попробуем объединить вызовы bsdtar и cp логическим И. Получится следующее:
{line-numbers: false, format: Bash}
```
bsdtar -cjf ~/photo.tar.bz2 ~/photo &&
  echo "bsdtar - OK" > results.txt ||
  echo "bsdtar - FAILS" > results.txt &&
cp -f ~/photo.tar.bz2 /d &&
  echo "cp - OK" >> results.txt ||
  echo "cp - FAILS" >> results.txt
```

Что будет делать эта команда? Для удобства перепишем её в виде логического выражения. Заменим каждый вызов команды или утилиты на букву латинского алфавита. Получится следующее:
{line-numbers: false, format: Bash}
```
B && O1 || F1 && C && O2 || F2
```

Буквы B и C обозначают вызовы утилит bsdtar и cp. O1 и F1 — это вывод в лог-файл строк "bsdtar - OK" и "bsdtar - FAIL". Аналогично, O2 и F2 — это вывод результата cp.

Если B истинно, порядок исполнения команд очевиден. Последовательность действий будет такой:

1. B
2. O1
3. C
4. O2 или F2

Если же bsdtar вернёт ошибку, значение B будет ложь. Тогда выполнятся такие действия:

1. B
2. F1
3. C
4. O2 или F2

Операция копирования не имеет смысла, если архивирование завершилось с ошибкой. Лишние проблемы создаёт поведение утилиты bsdtar. Если указанного каталога или файла не существует, утилита создаст пустой архив. В этом случае cp успешно его скопирует. После этого в лог-файл запишется строка "cp - OK". Тогда лог-файл будет таким:
{line-numbers: true}
```
bsdtar - FAILS
cp - OK
```

Такой вывод только запутает пользователя.

Вернёмся к нашему выражению:
{line-numbers: false, format: Bash}
```
B && O1 || F1 && C && O2 || F2
```

Почему утилита cp вызывается после ошибки в bsdtar? Дело в том, что команда echo всегда выполняется успешно. Её код возврата всегда истинен. Это значит, что значения O1, F1, O2 и F2 — истина.

Рассмотрим только команду вызова bsdtar и вывод её результата в лог-файл. Ей соответствует следующая часть логического выражения:
{line-numbers: false, format: Bash}
```
B && O1 || F1
```

Заключим левую часть выражения в скобки:
{line-numbers: false, format: Bash}
```
(B && O1) || F1
```

Теперь мы получили логическое ИЛИ для операндов (B && O1) и F1. F1 — всегда истина. Поэтому и всё выражение всегда истинно.

Проблему можно решить, если инвертировать результат вызова F1 с помощью логического НЕ. Оно обозначается как восклицательный знак !. Получим такое выражение:
{line-numbers: false}
```
B && O1 || ! F1 && C && O2 || F2
```

Теперь в случае ошибки утилиты bsdtar в лог-файл будет выведено "bsdtar - FAIL". Но оставшаяся часть выражения всё равно будет обработана. Операции C и O2 не будут выполнены. Они связаны логическим И с результатом F1, который всегда ложен. Но после них идёт действие F2. Оно будет выполнено.

Для удобства добавим к нашему выражению скобки. Получим:
{line-numbers: false}
```
(B && O1 || ! F1 && C && O2) || F2
```

Теперь очевидно, что если выражение в скобках ложно, Bash выполнит действие F2. Иначе ему не вывести значение всего выражения.

В результате выполнения всей команды в лог-файл будет выведено:
{line-numbers: true}
```
bsdtar - FAILS
cp - FAILS
```

Такой вывод лучше предыдущего. Теперь утилита cp не вызывается и пустой архив не копируется. Но представьте, что в нашей команде резервного копирования 100 действий. Если ошибка произойдёт на 50-ом действии, результаты всех оставшихся всё равно попадут в лог-файл. Этот вывод только помешает найти проблему. Лучшим решением было бы прекратить выполнение команды после первой же ошибки. Для этого сгруппируем вызовы утилит и выводы их результатов в лог-файл. Получим:
{line-numbers: false}
```
(B && O1 || ! F1) && (C && O2 || F2)
```

Проверим, что теперь произойдёт если B ложно. В этом случае выполнится действие F1. Его результат инвертируется. Поэтому вся левая часть выражения будет ложной:
{line-numbers: false}
```
(B && O1 || ! F1)
```

Дальше из-за короткого замыкания правый операнд логического И не вычисляется. Это значит, что все действия в правой части выражения не выполнятся:
{line-numbers: false}
```
(C && O2 || F2)
```

Мы получили нужное нам поведение.

Добавим последний штрих. Результат действия F2 нужно инвертировать. Тогда всё выражение будет ложным, если C ложно. Это значит, что команда резервного копирования завершилась ошибкой, если утилита cp не смогла отработать. Звучит логично. Кроме того, это полезно при интеграции нашей команды с другими командами.

Конечный вариант нашего выражения будет таким:
{line-numbers: false}
```
(B && O1 || ! F1) && (C && O2 || ! F2)
```

Теперь вернёмся к реальному коду на Bash. Наша команда резервного копирования стала такой:
{line-numbers: true, format: Bash}
```
(bsdtar -cjf ~/photo.tar.bz2 ~/photo &&
  echo "bsdtar - OK" > results.txt ||
  ! echo "bsdtar - FAILS" > results.txt) &&
(cp -f ~/photo.tar.bz2 /d &&
  echo "cp - OK" >> results.txt ||
  ! echo "cp - FAILS" >> results.txt)
```

Как это часто бывает в программировании, такую команду несложно написать, но трудно прочитать и понять.

### Плохое техническое решение

Мы написали длинную и сложную Bash-команду резервного копирования. Если она выполняется регулярно, её надо где-то сохранить. Иначе каждый раз придётся набирать команду вручную в окне терминала.

Все выполненные в терминале команды автоматически сохраняются в файле истории. У каждого пользователя он свой по пути `~/.bash_history`. По комбинации клавиш Ctrl+R в этом файле можно быстро найти нужную команду.

Что если мы просто сохраним команду резервного копирования в файле истории? Там её можно будет быстро найти и исполнить. Это решение кажется надёжным и удобным. Но не торопитесь с выводами. Давайте рассмотрим возможные проблемы.

Прежде всего размер файла истории ограничен. По умолчанию сохраняются только 500 последних выполненных команд. Если превысить это число, то каждая новая команда будет записана вместо самой старой. Из-за этого команда резервного копирования может быть случайно удалена из истории.

Максимальный размер файла истории можно увеличить. Но сразу возникает вопрос: увеличить на сколько? Какой размер не выберем, есть риск его переполнения. Можно вообще снять ограничение на размер. Тогда будут сохраняться все введённые команды, а старые никогда не будут удаляться.

Кажется, нам удалось найти решение задачи: файл истории с неограниченным размером. Могут ли с ним возникнуть какие-то проблемы? Давайте подумает. Предположим, что вы используйте Bash год или два. Все введённые за это время команды попадут в файл `.bash_history`. Учтите, что одни и те же команды в нём дублируются. Например, каждая команда `cd ~` будет записана в этот файл, даже если она там уже есть. Скорее всего за год размер файла достигнет нескольких сотен мегабайт. При этом большая часть информации в нём не нужна. Нас интересует небольшой набор команд, которые мы используем регулярно. В результате возникает первая проблема: нерациональное использование места на жёстком диске.

Вы можете возразить, что хранить лишние две-три сотни мегабайт — не проблема для современных компьютеров. Да, это так. Но не забывайте, что по нажатию Ctrl+R Bash ищет нужную команду по всему файлу `.bash_history`. Чем он больше, тем дольше длится поиск. Со временем вы станете ждать десятки секунд даже на мощном компьютере. Дальше с ростом файла время ожидания станет только больше.

Разрастание файла истории увеличивает время поиска. Не только потому, что Bash приходится перебирать больше строк в нём. По нажатию Ctrl+R надо ввести начало искомой команды. Представьте, что история огромна. Тогда в ней много команд, которые начинаются одинаково. Это значит, что вам придётся набрать больше символов, чтобы найти из них нужную. Неудобство вызова команды — это вторая проблема нашего решения.

Предположим, у вас появились новые альбомы фотографий. Они хранятся не в каталоге `~/photo`, а например в `~/Documents/official_photo`. Наша команда резервного копирования работает только с путём `~/photo`. Чтобы скопировать фотографии из другого пути, команду надо переписать. Выполните новую команду. Теперь она тоже сохранилась в файле истории `.bash_history`. Это опять увеличит время её поиска. Итак, сложность расширения функций — третья проблема.

Возможно у вас уже есть несколько команд для резервного копирования. Одна копирует фотографии, а другая документы. Объединить их будет проблематично. Вам придётся написать новую команду, в которую войдут действия из уже существующих.

Какой можно сделать вывод? Файл истории не подходит для долговременного хранения команд. Причина всех возникших проблем одна. Мы пытаемся использовать механизм файла истории не по назначению. Он создавался не для этого. В результате мы пришли к плохому техническому решению.

От плохих решений не застрахован никто. Профессионалы с большим опытом тоже нередко к ним приходят. Почему? Причины бывают разные. В нашем случае сыграл роль недостаток знаний. Мы освоились с работой Bash в режиме командного интерпретатора. Эти знания мы применили для новой задачи. Но всех её требований не учли. Как оказалось, просто заархивировать и скопировать файлы недостаточно.

Полный список требований выглядит так:

1. Команда должна храниться неограниченно долго.
2. Команда должна быстро вызываться.
3. Нужна возможность для её расширения.
4. Нужна возможность для сочетания её с другими командами.

Для начала оценим свои знания Bash. Их просто недостаточно, чтобы удовлетворить всем этим требованиям. Все известные нам механизмы не подходят. Может быть нам бы помог Bash-скрипт? Предлагаю изучить его возможности. Затем проверим, подходит ли он для нашей задачи.

### Запуск скрипта

Создадим Bash-скрипт с нашей командой для резервного копирования. Для этого сделайте следующее:

1. Откройте редактор исходного кода и создайте в нём новый файл. Если вы интегрировали Notepad++ в Bash, выполните команду:
{line-numbers: false, format: Bash}
```
notepad++ ~/photo-backup.sh
```

2. Скопируйте команду резервного копирования в файл:
{line-numbers: false, format: Bash}
```
(bsdtar -cjf ~/photo.tar.bz2 ~/photo &&
  echo "bsdtar - OK" > results.txt ||
  ! echo "bsdtar - FAILS" > results.txt) &&
(cp -f ~/photo.tar.bz2 /d &&
  echo "cp - OK" >> results.txt ||
  ! echo "cp - FAILS" >> results.txt)
```

3. Сохраните файл с именем `photo-backup.sh` в домашнем каталоге пользователя.

4. Закройте редактор.

Мы получили файл Bash-скрипта. Чтобы его исполнить, запустите интерпретатор и передайте скрипт первым параметром. Запустить интерпретатор можно по имени его исполняемого файла — `bash`:
{line-numbers: false, format: Bash}
```
bash photo-backup.sh
```

Мы только что написали и запустили наш первый Bash-скрипт. Он представляет собой последовательность команд, записанных в файл. Команды исполняются в том же порядке, как если бы вы читали их из скрипта и вводили вручную.

Запускать скрипты с явным вызовом интерпретатора Bash неудобно. Есть способ запускать их так же как и любую GNU-утилиту: по относительному или абсолютному пути. Для этого скрипт придётся изменить. Вот порядок действий:

1. В окне терминала выполните команду:
{line-numbers: false, format: Bash}
```
chmod +x ~/photo-backup.sh
```

2. Откройте файл скрипта в редакторе и добавьте в начало следующую строку:
{line-numbers: false, format: Bash}
```
#!/bin/bash
```

3. Сохраните изменённый файл и закройте редактор.

Теперь скрипт запускается по относительному или абсолютному пути.

Разберём наши действия. Первое, что мешает запустить скрипт после его создания — это права доступа. По умолчанию все новые файлы получают следующие права:
{line-numbers: false}
```
-rw-rw-r--
```

Это значит, что владелец и его группа могут читать и изменять файл. Все остальные могут только читать. Запускать файл не может никто.

Утилита chmod меняет права указанного файла. Мы передали ей опцию `+x`. В результате все пользователи смогут запускать файл. Его битовая маска прав стала такой:
{line-numbers: false}
```
-rwxrwxr-x
```

Теперь файл можно запустить по относительному или абсолютному пути. В этом случае ваш командный интерпретатор попробует его исполнить. Если вы используете Bash, скрипт выполнится корректно.

Если ваш командный интерпретатор не Bash (например, [C shell](https://ru.wikipedia.org/wiki/Csh)), скрипт вероятно завершится с ошибкой. Проблема в том, что скрипт написан на языке одного интерпретатора, а исполняется другим.

В скрипте можно явно указать интерпретатор, который должен его исполнять. Для этого в начале файла напечатайте [**шебанг**](https://ru.wikipedia.org/wiki/Шебанг_(Unix)). Шебангом называются символы решётка и восклицательный знак #!. После них идёт абсолютный путь до файла интерпретатора. В нашем случае получится такая строка:
{line-numbers: false, format: Bash}
```
#!/bin/bash
```

Теперь Bash будет исполнять скрипт, независимо от выбранного пользователем командного интерпретатора.

Если в скрипте не указан интерпретатор для запуска, утилита file определит его как обычный текстовый файл:
{line-numbers: false, format: Bash}
```
~/photo-backup.sh: ASCII text
```

После добавления строки `#!`, тот же файл определится как Bash-скрипт:
{line-numbers: false, format: Bash}
```
~/photo-backup.sh: Bourne-Again shell script, ASCII text executable
```

В некоторых системах Unix (например, FreeBSD) путь к Bash отличается от стандартного `/bin/bash`. Если вам важна переносимость скриптов, то вместо абсолютного пути до интерпретатора указывайте следующее:
{line-numbers: false, format: Bash}
```
#!/usr/bin/env bash
```

С помощью утилиты env исполняемый файл Bash будет найден по одному из путей переменной `PATH`.

### Последовательность команд

Листинг 3-1 демонстрирует наш скрипт.

{caption: "Листинг 3-1. Скрипт для резервного копирования", line-numbers: true, format: Bash}
![`photo-backup.sh`](code/BashScripting/photo-backup.sh)

Команда резервного копирования слишком длинная. Из-за этого её трудно читать и изменять. Попробуем разбить её на две отдельные команды. Результат приведён в листинге 3-2.

{caption: "Листинг 3-2. Разделение команд bsdtar и cp", line-numbers: true, format: Bash}
![`photo-backup-commands.sh`](code/BashScripting/photo-backup-commands.sh)

Поведение скрипта изменилось. Теперь команды не связаны логическим И. Поэтому утилита cp будет вызываться независимо от результата bsdtar. Такое поведение неправильно.

Исправим скрипт. Он должен завершаться при ошибке утилиты bsdtar. Чтобы завершить скрипт, воспользуемся командой exit. В качестве параметра она принимает код возврата. Скрипт вернёт этот код после своего завершения.

Листинг 3-3 демонстрирует скрипт с вызовом exit.

{caption: "Листинг 3-3. Добавление команды exit", line-numbers: true, format: Bash}
![`photo-backup-exit-subshell.sh`](code/BashScripting/photo-backup-exit-subshell.sh)

Мы внесли два изменения в команду вызова утилиты bsdtar. Сначала она соответствовала такому выражению:
{line-numbers: false}
```
B && O1 || ! F1
```

После добавления exit выражение стало выглядеть так:
{line-numbers: false}
```
B && O1 || (F1 ; E)
```

Команда exit обозначена как E. Теперь если bsdtar вернёт ошибку, будет вычислен правый операнд логического ИЛИ. Он равен `(F1 ; E)`. Мы удалили отрицание результата команды echo. Этот результат больше не важен. Не зависимо от него после echo будет вызван exit. Команды, разделённые точкой с запятой, выполняются друг за другом без каких-либо условий.

С нашим решением есть одна проблема. Когда интерпретатор встречает круглые скобки в скрипте или команде, он запускает сам себя в [дочернем процессе](https://en.wikipedia.org/wiki/Child_process). Такой дочерний процесс называется **subshell**. Он исполняет указанные в скобках команды. После этого управление передаётся обратно родительскому процессу Bash, породившему subshell. Родительский процесс продолжает исполнение скрипта или команды.

В нашем случае команда exit означает выход из subshell. Выполняющий скрипт родительский процесс Bash продолжит работу. Чтобы решить эту проблему, надо заменить круглые скобки на фигурные { и }. Указанные в них команды будут выполняться в текущем процессе Bash без создания subshell. Исправленная версия скрипта приведена в листинге 3-4.

{caption: "Листинг 3-4. Вызов exit в том же процессе Bash", line-numbers: true, format: Bash}
![`photo-backup-exit.sh`](code/BashScripting/photo-backup-exit.sh)

Обратите внимание на обязательную точку с запятой перед закрывающей фигурной скобкой }. Также обязательны пробелы после открывающей скобки { и перед закрывающей }.

Есть решение изящнее, чем вызов команды exit. Предположим, что скрипт нужно завершить после первой команды, вернувшей ненулевой код возврата. Для этого используйте встроенную команду set. Она изменяет параметры работы интерпретатора. В нашем случае команду надо вызвать с опцией `-e`:
{line-numbers: false, format: Bash}
```
set -e
```

Эту же опцию `-e` можно указать при явном запуске Bash. Например:
{line-numbers: false, format: Bash}
```
bash -e
```

У опции `-e` есть [несколько проблем](http://mywiki.wooledge.org/BashFAQ/105). Опция меняет поведение только текущего процесса Bash. Порождённые им subshell работают как обычно.

Каждая команда в конвейере или логическом операторе выполняется в отдельном subshell. Поэтому опция `-e` никак не повлияет на поведение этих команд. В нашем случае такое решение не подойдёт.

### Параметризация

Предположим, что вы перенесли фотографии из каталога `~/photo` в `~/Documents/Photo`. Тогда в нашем скрипте резервного копирования тоже придётся поменять путь. После изменения мы получим код как на листинге 3-5.

{caption: "Листинг 3-5. Новый каталог фотографий", line-numbers: true, format: Bash}
![`photo-backup-path.sh`](code/BashScripting/photo-backup-path.sh)

Каждый раз при смене каталога фотографий придётся редактировать скрипт. Это неудобно. Лучше сделать скрипт универсальным. Для этого он должен принимать путь к каталогу с фотографиями в качестве параметра.

При запуске любого Bash-скрипта в него можно передать параметры командной строки. Это работает точно так же как и для любой GNU-утилиты. Просто укажите параметры через пробел после имени скрипта. Например:
{line-numbers: false, format: Bash}
```
./photo-backup.sh ~/Documents/Photo
```

Запустите наш скрипт этой командой. Интерпретатор Bash передаст в него путь к фотографиям `~/Documents/Photo`. Этот путь будет доступен в коде скрипта через переменную `$1`. Если передать больше параметров, они будут доступны через переменные `$2`, `$3`, `$4` и т. д. в зависимости от их количества. Эти параметры называются позиционными (**positional parameters**).

В переменную `$0` запишется относительный путь к скрипту `./photo-backup.sh`.

Перепишем наш скрипт. Пусть путь до каталога фотографий читается из первого параметра. Получим код как в листинге 3-6.

{caption: "Листинг 3-6. Чтение пути из первого параметра", line-numbers: true, format: Bash}
![`photo-backup-parameter-path.sh`](code/BashScripting/photo-backup-parameter-path.sh)

Путь до фотографий хранится в переменной `$1`. Мы подставляем её значение в вызов утилиты bsdtar. При этом обращение к переменной заключается в кавычки. Если их не поставить, сработает механизм word splitting. Тогда путь содержащий пробелы будет разделён на несколько параметров.

Предположим, что фотографии хранятся в каталоге `~/photo album`. Тогда команда запуска скрипта будет такой:
{line-numbers: false, format: Bash}
```
./photo-backup.sh "~/photo album"
```

Если передать параметр `$1` без кавычек в утилиту bsdtar, её вызов будет таким:
{line-numbers: false, format: Bash}
```
bsdtar -cjf ~/photo.tar.bz2 ~/photo album &&
  echo "bsdtar - OK" > results.txt ||
  { echo "bsdtar - FAILS" > results.txt ; exit 1 ; }
```

В этом случае утилита bsdtar получит строку "~/photo album" по частям. Вместо одного параметра будет два: "~/photo" и "album". Таких каталогов не существует. Поэтому скрипт завершится с ошибкой.

Заключать пути в кавычки только при вызове скрипта недостаточно. Кавычки надо применять во всех местах подстановки переменной `$1 `. При вызове скрипта они обрабатываются и отбрасываются командным интерпретатором Bash. Наш скрипт выполняет не этот процесс. Вместо этого он запускает дочерний процесс Bash, который читает и исполняет скрипт. Дочерний процесс Bash не знает про кавычки в команде вызова скрипта.

Итак, что нам дала параметризация скрипта? Вместо решения для резервного копирования фотографий мы сделали универсальную программу. Она работает с любыми входными файлами: документами, медиафайлами, исходным кодом программ и т.д.

У нашего скрипта есть ещё одна проблема. Она связана с именем архива. Предположим, что наш скрипт вызывается дважды для копирования фотографий и документов:
{line-numbers: true, format: Bash}
```
./photo-backup.sh ~/photo
./photo-backup.sh ~/Documents
```

Обе эти команды создают архив с именем `photo.tar.bz2` в домашнем каталоге пользователя. Обе копируют архив на диск D. Очевидно, что результат второй команды полностью перезапишет результат первой. Это не то, что нам нужно.

Попробуем исправить ошибку. Для этого подставим первый параметр скрипта не только в качестве пути к архивируемым данным, но и вместо имени архива. Отредактированный скрипт приведён в листинге 3-7.

{caption: "Листинг 3-7. Чтение имени архива из первого параметра", line-numbers: true, format: Bash}
![`photo-backup-parameter-name.sh`](code/BashScripting/photo-backup-parameter-name.sh)

Теперь имя архива будет соответствовать каталогу с архивируемыми данными. Допустим, вы вызовите скрипт так:
{line-numbers: true, format: Bash}
```
./photo-backup.sh ~/Documents
```

Тогда будет создан архив с именем `Documents.tar.bz2`. Он будет скопирован на диск D. При этом его имя не конфликтует с именем архива фотографий `photo.tar.bz2`.

Исправим последний недочёт скрипта. Заменим копирование архива на переименование. Тогда ненужный промежуточный архив в каталоге пользователя будет удалён. Результат приведён в листинге 3-8.

{caption: "Листинг 3-8. Удаление временного архива", line-numbers: true, format: Bash}
![`photo-backup-mv.sh`](code/BashScripting/photo-backup-mv.sh)

Теперь у нас есть универсальный скрипт для резервного копирования. Его старое имя `photo-backup.sh` больше не подходит. Ведь скрипт умеет копировать любые данные. Переименуем его на `make-backup.sh`.

### Сочетание с утилитами и командами

Наш универсальный скрипт для резервного копирования можно сочетать с GNU-утилитами, Bash-командами и другими скриптами.

Сейчас скрипт вызывается только по абсолютному или относительному пути. Если интегрировать его в Bash, вы сможете вызывать скрипт по имени. Тогда его станет удобнее сочетать с другими программами.

Нам знакомы два способа интеграции приложения с Bash по опыту настройки Notepad++. Кроме них есть ещё третий способ. Вот полный список вариантов:

1. Добавить путь до скрипта в переменную `PATH`. Для этого отредактируйте файл `~/.bash_profile`.

2. Определить псевдоним alias с абсолютным путём до скрипта. Это можно сделать в файле `~/.bashrc`.

3. Скопировать скрипт в каталог `/usr/local/bin`. Путь до него по умолчанию добавляется в переменную `PATH`. Если в вашем окружении MSYS2 этого каталога нет — создайте его.

I> Чтобы удалить объявленный псевдоним, вызовите Bash-команду `unalias`. Пример её использования для нашего скрипта:
{line-numbers: false, format: Bash}
```
unalias make-backup.sh
```

После интеграции с Bash скрипт запускается по имени. Например, так:
{line-numbers: false, format: Bash}
```
make-backup.sh ~/photo
```

Скрипт можно использовать в конструкциях с конвейерами и логическими операторами также, как любую встроенную команду Bash или GNU-утилиту.

Рассмотрим пример. Предположим, что нужно создать резервную копию всех PDF документов из каталога `~/Documents`. Эти документы можно найти с помощью утилиты find. Например, так:
{line-numbers: false, format: Bash}
```
find ~/Documents -type f -name "*.pdf"
```

Заархивируем и скопируем каждый найденный файл с помощью нашего скрипта. Команда для этого выглядит так:
{line-numbers: false, format: Bash}
```
find ~/Documents -type f -name "*.pdf" -exec make-backup.sh {} \;
```

I> Как мы уже знаем, экранированная точка с запятой `\;` означает выполнение действия над каждым из указанных файлов.

В результате на диск D будут скопированы архивы с каждым найденным PDF файлом. То есть каждый файл окажется в отдельном архиве. Это неудобно. Будет лучше собрать все PDF файлы в один архив.

Попробуем обработать нашим скриптом все найденные файлы за раз. Получится такая команда:
{line-numbers: false, format: Bash}
```
find ~/Documents -type f -name *.pdf -exec make-backup.sh {} +
```

В результате на диске D мы получим архив только первого найденного PDF файла. Куда делись остальные документы? Рассмотрим вызов утилиты bsdtar в нашем скрипте. Для простоты опустим выводы echo в лог-файл. Вызов выглядит так:
{line-numbers: false, format: Bash}
```
bsdtar -cjf "$1".tar.bz2 "$1"
```

Проблема в том, что мы обрабатываем только первый позиционный параметр, переданный на вход скрипта. Он сохраняется в переменной `$1`. При этом игнорируются все дальнейшие параметры в переменных `$2`, `$3` и т.д. Но именно в них передаются результаты поиска утилиты find, когда после действия `-exec` идёт знак +.

Чтобы решить проблему, воспользуемся переменной `$@`. Интерпретатор сохраняет в неё все параметры, переданные в скрипт. Перепишем вызов bsdtar следующим образом:
{line-numbers: false, format: Bash}
```
bsdtar -cjf "$1".tar.bz2 "$@"
```

Теперь вместо первого параметра `$1` мы передаём утилите bsdtar все входные параметры скрипта `$@`. Обратите внимание, что в качестве имени архива по-прежнему подставляется первый параметр `$1`.

Листинг 3-9 демонстрирует исправленный скрипт. Он обрабатывает произвольное число входных параметров.

{caption: "Листинг 3-9. Обработка произвольного числа входных параметров", line-numbers: true, format: Bash}
![`make-backup.sh`](code/BashScripting/make-backup.sh)

В Bash есть переменная `$*`. Она очень похожа на `$@`. Если строку из переменной `$*` заключить в двойные кавычки при подстановке, Bash интерпретирует её как одно слово. В этом же случае строка в переменной `$@` интерпретируется как набор слов.

Рассмотрим пример. Предположим, наш скрипт вызывается так:
{line-numbers: false, format: Bash}
```
make-backup.sh "one two three"
```

Тогда при подстановке "$*" в скрипте мы получим:
{line-numbers: false, format: Bash}
```
"one two three"
```

Подстановка же "$@" даст следующее:
{line-numbers: false, format: Bash}
```
"one" "two" "three"
```

W> Всегда предпочитайте использовать `$@` вместо `$*`. Единственное исключение это случай, когда все входные параметры надо представить одним словом.

### Возможности скриптов

На примере задачи резервного копирования мы рассмотрели возможности Bash-скриптов.

Напомним требования к задаче:

1. Команда должна храниться неограниченно долго.
2. Команда должна быстро вызываться.
3. Нужна возможность для её расширения.
4. Нужна возможность для сочетания её с другими командами.

Наш финальный скрипт `make-backup.sh` удовлетворяет всем этим требованиям. Проверим каждое из них:

1. Скрипт хранится на жёстком диске. Это долговременная память.

2. Скрипт легко интегрировать с Bash. Благодаря этому, его так же удобно вызывать, как и любую GNU-утилиту.

3. Скрипт представляет собой последовательность команд. Каждая из них начинается с новой строки. Его удобно читать и редактировать. Благодаря параметризации, его легко обобщить для решения однотипных задач.

4. За счёт интеграции с Bash скрипт удобно сочетать с другими командами, в том числе с помощью конвейеров и логических операторов.

Если ваша задача требует любую из перечисленных возможностей — пишите Bash-скрипт.
