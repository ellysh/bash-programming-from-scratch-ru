# Заключение

На этом завершается наше знакомство с Bash. Мы рассмотрели только самые азы языка. Многие темы остались за рамками этой книги. Вам придётся познакомиться с ними самостоятельно, если вы планируете применять Bash в своей работе.

Вот несколько тем, с которых стоит начать углубленное изучение Bash:

* [Работа со строками](https://www.opennet.ru/docs/RUS/bash_scripting_guide/x4171.html).

* [Регулярные выражения](https://www.opennet.ru/docs/RUS/bash_scripting_guide/c11895.html).

* [Потоковый редактор sed](https://www.opennet.ru/docs/RUS/bash_scripting_guide/a14586.html#AEN14605).

* [Язык обработки входного потока awk](https://www.opennet.ru/docs/RUS/bash_scripting_guide/x14802.html).

I> GNU-утилиты sed и awk не относятся к языку Bash, но значительно расширяют его возможности для обработки строк.

Знать эти темы необязательно, если вы применяете Bash для решения простых задач и элементарной автоматизации.

Возможно, вам понравилось программировать. Вы планируете развивать ваши навыки дальше. Что делать после прочтения этой книги?

Прежде всего признаем, что Bash — это не **язык программирования общего назначения**. Этот термин означает язык для разработки приложений в нескольких прикладных областях. Его конструкции универсальны и подходят для решения задач различных типов.

Bash — это [**предметно-ориентированный**](https://ru.wikipedia.org/wiki/Предметно-ориентированный_язык) язык для узкого круга задач. Значит ли это, что он бесполезен на практике? Вовсе нет. Bash служит вспомогательным инструментом для разработчиков ПО. Сегодня он применяется для интеграции больших программных проектов, тестирования, сборки программ и автоматизации. Однако, вы не найдёте коммерческий проект, написанный только на Bash. Этот язык хорошо справляется с задачами, для которых он создавался. Но во многих прикладных областях он уступает современным языкам общего назначения.

Языки программирования не создаются просто так для развлечения. Часто случалось так, что автор языка решал какую-то прикладную задачу. Он не находил подходящего инструмента для её решения. Тогда для этой задачи создавался новый язык.

Развитие языков программирования идёт по одному из двух путей.

Первый вариант — новый язык предлагает универсальные конструкции, которые подходят нескольким прикладным областям. В этом случае он становится языком общего назначения. Его автор продолжает добавлять новые возможности и библиотеки, которые ориентированы на разные прикладные области.

Второй вариант — конструкции языка применимы только в одной области. Они ориентированы на задачи определённого типа. В этом случае язык становится предметно-ориентированным. Его автор не будет добавлять возможности, которые были бы полезны в других прикладных областях.

Два варианта развития языков приводят нас к важному выводу. Каждый современный язык общего назначения хорош только в нескольких прикладных областях. Нет ни одного языка, который бы эффективно справлялся с любой задачей. Это означает, что прикладная область диктует выбор языка программирования.

Вернёмся к вопросу о вашем следующем шаге в изучении программирования. Вы прочитали эту книгу. Теперь пришло время выбрать интересную вам прикладную область. Как это сделать?

Вы уже имеете опыт работы с компьютером и знаете несколько программ на уровне пользователя. Прочитайте в интернете статьи об этих программах. Подумайте: хотите ли вы разрабатывать что-то похожее? Возможно, опыт пользователя подскажет подходящую вам прикладную область.

Предположим, что вы определились с прикладной областью. Теперь вам нужно выбрать подходящий для неё язык программирования.

Таблица 5-1 поможет вам с выбором языка. Она приводит несколько популярных языков для каждой прикладной области.

{caption: "Таблица 5-1. Прикладные области разработки ПО", width: "100%"}
| Прикладная область | Языки программирования |
| --- | --- |
| [Приложения для мобильных устройств](https://ru.wikipedia.org/wiki/Мобильное_приложение) | Java, C, C++, HTML5, JavaScript |
|  | |
| [Web-разработка](https://ru.wikipedia.org/wiki/Веб-приложение) ([фронтэнд](https://ru.wikipedia.org/wiki/Фронтенд_и_бэкенд)) | JavaScript, PHP, HTML5, CSS, SQL |
|  | |
| [Web-разработка](https://ru.wikipedia.org/wiki/Веб-приложение) ([бэкэнд](https://ru.wikipedia.org/wiki/Фронтенд_и_бэкенд)) | JavaScript, Python, Ryby, Perl, C#, Java, Go |
|  | |
| [Высоконагруженное серверное ПО](https://ru.wikipedia.org/wiki/Сервер_(программное_обеспечение)) | C++, Rust, Python, Ruby, SQL |
|  | |
| [Системное администрирование](https://ru.wikipedia.org/wiki/Системный_администратор) | Bash, Python, Perl, Ruby |
|  | |
| [Встраиваемые системы](https://ru.wikipedia.org/wiki/Встраиваемая_система) | C, C++, Rust, Ассемблер |
|  | |
| [Машинное обучение](https://ru.wikipedia.org/wiki/Машинное_обучение) и [анализ данных](https://ru.wikipedia.org/wiki/Анализ_данных) | Python, Java, C++ |
|  | |
| [Информационная безопасность](https://ru.wikipedia.org/wiki/Информационная_безопасность) | C, C++, Python, Bash |
|  | |
| [Корпоративное ПО](https://ru.qwe.wiki/wiki/Enterprise_software) | Java, C#, C++, SQL |
|  | |
| [Компьютерные игры](https://ru.wikipedia.org/wiki/Компьютерная_игра) | C++ |

Чтобы стать высококлассным специалистом, недостаточно знать язык программирования. Необходимо также владеть технологиями, которые применяются в конкретной прикладной области. Например, специалист по информационной безопасности должен хорошо разбираться в устройстве сетей и операционных систем. С профессиональным ростом к вам придёт понимание того, какие технологии надо изучать.

Предположим, вы определились с прикладной областью и языком программирования. Теперь пришло время записаться на онлайн-курс. Эта книга познакомила вас с основами программирования. Поэтому изучение нового языка пойдёт быстрее. Некоторые конструкции Python или С++ покажутся вам похожими на Bash. Однако, у этих языков есть возможности, которые вам придётся изучить с нуля. Не теряйте мотивации, применяйте новые знания на практике и учитесь на своих ошибках. Только так вы добьётесь результата.

Надеюсь, вы узнали что-то новое из этой книги и приятно провели время за чтением. Если книга вам понравилась, поделитесь ею с друзьями. Также я буду благодарен, если вы уделите мне несколько минут и напишете отзыв на [Goodreads](https://www.goodreads.com/book/show/53883360-bash).

Если у вас остались вопросы или появились замечания по книге, пишите мне на почту [petrsum@gmail.com](mailto:petrsum@gmail.com). Также задавайте вопросы в разделе "Issues" [GitHub репозитория книги](https://github.com/ellysh/bash-programming-from-scratch-ru/issues).

Спасибо вам за то, что прочитали ["Программирование на Bash с нуля"](https://leanpub.com/programming-from-scratch)!

# Благодарности

Мало кто пишет книги самостоятельно и без поддержки. Эту книгу мне помогли написать несколько людей. Некоторые из них предложили мне общие идеи. Другие давали советы и указывали на ошибки. Этих людей я хочу здесь поблагодарить.

Спасибо Софии Каюновой за идею книги по программированию для начинающих. Тогда у меня появилась мотивация написать книгу для друзей, которым интересно программирование.

Спасибо Виталию Липатову за то, что познакомил меня с Linux и Bash. Он научил меня основам программирования. Также благодаря ему, я открыл для себя мир программам с открытым исходным кодом.

Спасибо Руслану Пясецкому за консультации по Bash. Он объяснил мне некоторые идиомы языка и указал на мои ошибки.

Также спасибо всем, кто поддерживал меня и мотивировал довести эту работу до конца.