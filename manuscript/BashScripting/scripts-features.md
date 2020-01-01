## Зачем нужны скрипты?

В прошлой главе мы научились писать достаточно сложные Bash команды с использованием конвейеров и коннекторов. С их помощью мы реализовали не только линейные алгоритмы, но и содержащие ветвление. Таким образом мы добились сложного поведения только средствами командного интерпретатора.

Может возникнуть вопрос: зачем вообще нужно объединять набор команд в законченную программу? Это разумное замечание. Предлагаю рассмотреть его подробнее.

### Команда для резервного копировния

Напишем команду для резервного копирования фотографий на [внешний жёсткий диск](https://ru.wikipedia.org/wiki/Внешний_жёсткий_диск). Она будет состоять всего из двух действий: архивирования и копирования. Предположим, что фотографии хранятся в каталоге `~/photo`, а `/d` -это точка монтирования внешнего диска. Тогда команда может выглядеть следующим образом:
{line-numbers: false}
```
bsdtar -cjf ~/photo.tar.bz2 ~/photo && cp -f ~/photo.tar.bz2 /d
```

Копирование выполняется только в случае успешного архивирования.

Для проверки корректности добавим вывод результатов каждой операции в лог-файл. Мы уже знаем, как это сделать для команд по отдельности с помощью вызова `echo`, коннеткоров `&&` и `||`:
{line-numbers: false}
```
bsdtar -cjf ~/photo.tar.bz2 ~/photo && echo "bsdtar - OK" > results.txt || echo "bsdtar - FAILS" > results.txt
cp -f ~/photo.tar.bz2 /d && echo "cp - OK" >> results.txt || echo "cp - FAILS" >> results.txt
```

Вопрос в том, как нам объединить эти две команды в одну? Попробуем прямолинейное решение с коннектором `&&` между ними:
{line-numbers: false}
```
bsdtar -cjf ~/photo.tar.bz2 ~/photo && echo "bsdtar - OK" > results.txt || echo "bsdtar - FAILS" > results.txt && cp -f ~/photo.tar.bz2 /d && echo "cp - OK" >> results.txt || echo "cp - FAILS" >> results.txt
```

Что будет делать эта команда? Для простоты рассмотрения перепишем её в виде логического выражения, заменив каждый вызов на буквы латинского алфавита:
{line-numbers: false}
```
B && O1 || F1 && C && O2 || F2
```

Буквы `B` и `C` обзначают команды `bsdtar` и `cp`. `O1` и`F1` - это вывод в лог-файл "OK" и "FAIL" соответственно для первой команды. Аналогично, `O2` и `F2` - это вывод для вызова утилиты `cp`.

В случае истинности `B`, команда отрабатывает корректно. Будет выполнена следующая последовательность действий:

1. B
2. O1
3. C
4. O2 или F2

Проблема возникнет, когда `B` ложно. В этом случае будет исполнено:

1. B
2. F1
3. C
4. O2 или F2

Очевидно, что операция копирования не имеет смысла, если архивирование завершилось с ошибкой. Ситуация усугубляется тем, что `bsdtar` создаёт пустой архив, если целевого каталога или файла не существует. В этом случае `cp` успешно скопирует его и запишет в лог-файл "cp - OK". В результате `results.txt` будет выглядеть следующим образом:
{line-numbers: false}
```
tar - FAILS
cp - OK
```

Такой вывод только запутает пользователя.

Причина нашего затруднения в том, что вызов `F1` (команда `echo`) всегда возвращает истину. Это приводит к тому, что выражение `B && O1 || F1` истинно в случае ошибки `bsdtar` и дальнейшие команды продолжат исполняться. Всё что нам нужно сделать - это инвертировать результат вызова `F1` с помощью логического НЕ, которое в Bash обозначается как `!`:
{line-numbers: false}
```
B && O1 || ! F1 && C && O2 || F2
```

Теперь в случае ошибки утилиты `bsdtar` в лог-файл будет выведено "bsdtar - FAIL". Но оставшаяся часть выражения всё равно будет обработана. Операции `C` и `O2` не будут выполнены, потому что связаны логическим И с результатом `F1`, который всегда ложен. Но операнд `F2` будет вычислен. На самом деле наше выражение выглядит теперь так:
{line-numbers: false}
```
(B && O1 || ! F1 && C && O2) || F2
```

В результате выполнения этой команды в лог файл будет выведено:
{line-numbers: false}
```
tar - FAILS
cp - FAILS
```

Такое поведение лучше предыдущего. Теперь не происходит вызова `cp` и копирования пустого архива. Но представьте, что мы пишем команду в которой около 100 операций. Если ошибка произойдёт, например, на 50-ой, вывод всех оставшихся всё равно попадёт в лог-файл. Это затруднит поиск проблемы. Правильным поведением в этом случае было бы прекращение выполнения всей команды после первой же ошибки. Чтобы добиться этого поведения, нам нужно сгруппировать каждую команду и её вывод следующим образом:
{line-numbers: false}
```
(B && O1 || ! F1) && (C && O2 || F2)
```

Рассмотрим, что произойдёт если `B` ложно. В этом случае отработает `F1` и вернёт ложь, благодаря отрицанию `!`. В результате всё выражение `(B && O1 || ! F1)` будет ложным. Тогда благодаря короткому замыканию, коннектор `&&` не станет вычислять свой правый операнд, равный выражению `(C && O2 || F2)`. Мы получим именно то поведение, которое нам нужно.

Добавим последний штрих. Имеет смысл также инвертировать вызов `F2` с помощью логического НЕ. Благодаря этому, наша команда будет ложной, если операция `B` истинна, а `C` ложна. Такое поведение может быть полезно, в случае интеграции нашей команды с другими или расширения её функций. В результате получим:
{line-numbers: false}
```
(B && O1 || ! F1) && (C && O2 || ! F2)
```

Если вернёмся обратно к реальному коду на Bash, наша команда станет выглядеть так:
{line-numbers: false}
```
(bsdtar -cjf ~/photo.tar.bz2 ~/photo && echo "bsdtar - OK" > results.txt || ! echo "bsdtar - FAILS" > results.txt) && (cp -f ~/photo.tar.bz2 /d && echo "cp - OK" >> results.txt || ! echo "cp - FAILS" >> results.txt)
```

### Неверное техническое решение

Мы написали достаточно длинную команду резервного копирования. Если её требуется выполнять регулярно, нам потребуется где-то её сохранить, чтобы не набирать каждый раз в окне терминала.

Мы уже знаем, что все выполненные Bash команды автоматически сохраняются в файле истории `~/.bash_history`. Тогда с помощью комбинации Ctrl+R найти эту команду не составит труда. Возможно, вам это решение покажется надёжным и удобным. Но не торопитесь с выводами. Давайте рассмотрим возможные проблемы.

Прежде всего размер истории Bash ограничен. По умолчанию сохраняются только 1000 последних команд. Если превысить это число, то самые новые начнут записываться вместо самых старых. Таким образом возникает риск случайно потерять нашу сохранённую команду.

Можно увеличить максимальный размер истории. Но сразу возникает вопрос: увеличить на сколько? Какой бы большой размер мы не выбрали, рано или поздно возникнет риск его переполнения. Есть вариант вообще снять ограничение на размер. Тогда будут сохраняться все введёные команды, а старые никогда не будут удаляться.

Кажется, нам удалось решить проблему и найти приемлемое техническое решение. Имеет ли оно какие-то побочные эффекты? Давайте подумает над этим вопросом. Предположим, что вы используйте Bash год или два. Все команды, ввёденые вами за это время попадут в файл `.bash_history`. Учтите, что одни и те же команды в нём дублируются. То есть, например, каждая команда `cd ~` будет записана в этот файл, независимо от того есть она в нём уже или нет. Можно предположить, что за год этот файл достигнет значительного размера около нескольких сотен мегабайт. При этом большая часть сохранённой в нём информации окажется не нужна. Нас интересует только несколько команд, которые мы используем регулярно. В результате, мы получим первый побочный эффект: нерациональное использование места на жёстком диске.

Вы можете возразить, что хранить лишние две-три сотни мегабайт - это не проблема для современных компьютеров. Да, это так. Но не забывайте, что при навигации по истории через нажатие Ctrl+R Bash ищет нужную команду по всему файлу `.bash_history`. Чем он больше, тем дольше будет длиться этот поиск. Рано или поздно он станет занимать десятки секунд даже на мощном копьютере. Дальше с ростом файла это время будет только увеличиваться.

Раздувание файла истории приводит к увеличению времени поиска. Это связано не только с тем, что Bash приходится перебирать больше строк. Поиск по Ctrl+R позволяет вам ввести начало нужной команды. Представьте себе, что история огромна. В этом случае в ней содержится очень много команд, которые начинаются одинаково. В результате вам придётся набирать больше символов, чтобы найти из них нужную. Неудобство вызова команды - это второй побочный эффект нашего решения.

Предположим, что у нас появились новые альбомы фотографий. Они хранятся не в каталоге `~/photo`, а например в `~/Documents/official_photo`. К сожалению, наша команда резервного копирования работаёт только с одним предопределённым путём. Чтобы она стала поддерживать другие, необходимо её переписать и добавить новые шаги для архивации и копирования каталога `~/Documents/official_photo`. В результате отредактированная команда также попадёт в историю `.bash_history`. Это опять же увеличит время на её поиск. Итак, сложность расширения функций - третий побочный эффект.

Если вы решите объединить нашу команду резервного копирования фотографий с аналогичной ей, которая копирует документы, это будет проблематично. Опять же понадобиться новая команда, которая сочетает в себе две существующие.

Какой можно сделать вывод из рассмотренных возможных проблем? Долговременное хранение команд в файле истории неудобно. Настоящая причина этого в том, что мы попытались использовать механизм для целей, к которым он не был предназначен. В результате мы пришли к техническому решению, которое неудобно в использовании и сопровождении.

Неверные технические решения распространены не только среди начинающих программистов. Профессионалы с большим опытом тоже их совершают и достаточно часто. В чём причина таких решений?

На самом деле причин ошибочных решений много. В нашем случае это пример нежелания учиться новому. Мы освоились с работой Bash в режиме командного интерпретатора. Но применяя полученные знания для новой задачи резервного копирования, мы не учли в полной мере её требования. Они звучат следующим образом:

1. Долговременное хранение команды.
2. Возможность её расширения.
3. Возможность сочетания с другими командами.
4. Удобство вызова.

Чтобы удовлетворить этим требованиям, наших знаний просто недостаточно. Поэтому нам нужно сначала изучить возможности Bash скриптов, а затем проверить, помогут ли новые знания в решении поставленной задачи.

### Возможности Bash скриптов

Сделаем скрипт на основе нашей команды для резервного копирования. Для этого выполните следующие действия:

1. Откройте редактор исходного кода и создайте в нём новый файл. Для Notepad++, интегрированного с Bash, команда запуска может выглядеть следующим образом:
{line-numbers: false}
```
notepad++ ~/photo-backup.sh
```

2. Скопируйте в файл команду резервного копирования:
{line-numbers: false}
```
(bsdtar -cjf ~/photo.tar.bz2 ~/photo && echo "bsdtar - OK" > results.txt || ! echo "bsdtar - FAILS" > results.txt) && (cp -f ~/photo.tar.bz2 /d && echo "cp - OK" >> results.txt || ! echo "cp - FAILS" >> results.txt)
```

3. Сохраните измененный файл и закройте редактор.

В результате мы получили файл скрипта `photo-backup.sh` в домашнем каталоге пользователя. Чтобы его исполнить, запустите интерпретатор командой `bash` и передайте имя файла первым параметром:
{line-numbers: false}
```
bash photo-backup.sh
```