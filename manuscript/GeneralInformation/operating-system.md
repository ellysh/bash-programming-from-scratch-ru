## Операционные системы

### История возникновения ОС

Подавляющее большинство пользователей компьютера понимает, зачем нужна [**операционная система**](https://ru.wikipedia.org/wiki/Операционная_система#Функции) (ОС). Как правило, при покупке или скачивании какого-то приложения вы обращаете внимание на системные требования. В них обязательно будет указано, какая ОС требуется для его запуска. Получается, что ОС — это некоторая программная платформа, которая нужна для работы приложений. Но откуда взялось это требование? Почему нельзя просто купить компьютер и запустить на нём приложение без всякой ОС?

Эти вопросы кажутся бессмысленными только на первый взгляд. Подумайте сами: современные ОС ввиду своей универсальности имеют множество функций. Большая их часть каждому конкретному пользователю просто не нужна. Но несмотря на это, для обслуживания этих функций ОС активно использует ресурсы компьютера. В результате для полезной нагрузки системы, то есть приложений которые пользователь хочет запустить, ресурсов остаётся намного меньше. Это приводит к медленной работе, зависаниям и даже перезагрузкам компьютера.

На самом деле первые [электромеханические компьютеры](https://ru.wikipedia.org/wiki/Табулятор) (табуляторы) вообще не имели ОС. На них работало одно единственное приложение, выполняющее арифметические операции. Данные для этих вычислений загружались с [**перфокарт**](https://ru.wikipedia.org/wiki/Перфокарта). Таким же образом выводились результаты. Несмотря на огромную стоимость таких машин и их узкую специализацию, они были востребованы и успешно применялись для переписи населения США в 1890 году. Это оказалось экономически целесообразнее ручного труда. Иллюстрация 1-1 демонстрирует табулятор, построенный Германом Холлеритом.

{caption: "Иллюстрация 1-1. Табулятор Холлерита", height: "30%"}
![Табулятор Холлерита](images/GeneralInformation/tabulating-machine.jpg)

Компьютеры успешно обходились без ОС до тех пор, пока оставались узкоспециализированными и выполняли одну единственную задачу. Однако, со временем эксплуатировать такие машины стало слишком дорого. Как правило, они разрабатывались в рамках государственных проектов гражданской или [военной направленности](https://ru.wikipedia.org/wiki/Манхэттенский_проект). Компьютер создавался под конкретный проект, а затем разбирался или простаивал. Если требования проекта менялись, машину не всегда удавалось перестроить для новых задач. Всё это привело к идее, а затем и созданию универсальных или программируемых компьютеров.

Впервые идею универсального компьютера в виде математической модели предложил Алан Тьюринг в 1936 году. Впоследствии эта модель стала известна как [**машина Тьюринга**](https://ru.wikipedia.org/wiki/Машина_Тьюринга). Она описывает абстрактный автомат, который способен выполнить любой [**алгоритм**](https://ru.wikipedia.org/wiki/Алгоритм).

Позднее в 1944 году Джон фон Нейман разработал конкретную архитектуру организации универсальной вычислительной машины. То есть если Алан Тьюринг предложил модель, как эта машина могла бы работать в теории, то Джон фон Нейман разработал способ её реализации на практике. Эта архитектура получила название [**архитектура фон Неймана**](https://ru.wikipedia.org/wiki/Архитектура_фон_Неймана) и применялась для создания первого в мире лампового компьютера [**ENIAC**](https://ru.wikipedia.org/wiki/ЭНИАК) (см. иллюстрацию 1-2). Для ввода и вывода информации в нём использовались перфокарты, как и в более ранних компьютерах. Ключевое отличие заключалось в том, что теперь вместе с данными на перфокартах загружалась и программа для исполнения. Благодаря этому, стало возможно быстро и с минимальными затратами адаптировать компьютер к решению новых задач.

{caption: "Иллюстрация 1-2. ЭНИАК", height: "30%"}
![ЭНИАК](images/GeneralInformation/eniac.jpg)

Как только компьютеры стали программируемыми, то есть пользователь получил возможность менять алгоритм их работы, возникли сложности. Загружаемые в них программы, должны были определять все требуемые от компьютера функции. Очень часто эти функции повторялись. Например, операции ввода-вывода или манипуляции с оборудованием. Для экономии времени разработки этот повторяющийся код выносили в служебные программы. Они и стали прототипом будущих ОС.

Вернёмся к нашему вопросу о необходимости ОС. Получается, она совершенно необязательна для запуска приложений на современном персональном компьютере. Такие программы есть и широко распространены. Например, утилиты проверки памяти, разбивки диска, антивирусы. Но их разработка обходится дорого, а запуск неудобен для пользователя, поскольку требует перезагрузки компьютера. Поэтому большинство программ пишется под ОС и использует её возможности.

### Возможности ОС

Почему мы начали изучение программирования с рассмотрения ОС? Иллюстрация 1-3 демонстрирует схему взаимодействия ОС с [**прикладными программами**](https://ru.wikipedia.org/wiki/Прикладное_программное_обеспечение) и [**аппаратным обеспечением**](https://ru.wikipedia.org/wiki/Аппаратное_обеспечение).

{caption: "Иллюстрация 1-3. Схема взаимодействия ОС с программами и аппаратным обеспечением", height: "50%"}
![Схема взаимодействия ОС](images/GeneralInformation/operating-system.png)

Из этой схемы становится понятно, что разработчики прикладных приложений, как правило, пользуются функциями и [**интерфейсом**](https://ru.wikipedia.org/wiki/API) ОС для доступа к аппаратным ресурсам. Именно ОС служит платформой, на которой будет выполняться ваша программа.

Итак, мы выяснили, что ОС необязательна, но позволяет быстрее и эффективнее разрабатывать программы. За счёт чего это происходит?

Прототипом ОС стал повторящийся код для разных приложений код, который выносился в отдельные служебные программы. В дальнейшем этот код развивался, в него добавлялись новые функции. В результате разработчики ОС выполнили большую часть работы, которую в противном случае пришлось бы делать программистам прикладных приложений. Разберёмся подробнее, что же это за функции?

Всё аппаратное обеспечение компьютера, т.е. его электронные и механические части, можно рассматривать как некоторые ресурсы для вычислений. Программы так или иначе пользуются ими в своих алгоритмах. Но для доступа к каждому виду ресурсов приходится следовать определённым правилам. Например, две программы не могут одновременно писать данные на [жёсткий диск](https://ru.wikipedia.org/wiki/Жёсткий_диск#Технологии_записи_данных) в одну и ту же область. Во-первых, запись осуществляется единственной магнитной головкой жёсткого диска. Во-вторых, данные записанные первым приложением будут затёрты данными второго. Поэтому одновременные запросы программ на запись должны блокироваться или помещаться в очередь и исполняться друг за другом. За эти механизмы отвечает ОС, а точнее её [**ядро**](https://ru.wikipedia.org/wiki/Ядро_операционной_системы) (см. иллюстрацию 1-3), в котором реализована [**файловая система**](https://ru.wikipedia.org/wiki/Файловая_система). Похожим образом организуется доступ ко всем [**периферийным**](https://ru.wikipedia.org/wiki/Периферийное_устройство) и внутренним устройствам компьютера. Этот доступ осуществляется через специальные программы, называемые [**драйверами устройств**](https://ru.wikipedia.org/wiki/Драйвер) (см. иллюстрацию 1-3).

Что такое периферийные устройства, и чем они отличаются от внутренних? К периферийным относятся все устройства, отвечающие за ввод и вывод информации, а также её хранение. Например, клавиатура, мышь, микрофон, монитор, колонки, жёсткий диск. Внутренние устройства отвечают за обработку информации, то есть непосредственное исполнение программ. К ним относят [**центральный процессор**](https://ru.wikipedia.org/wiki/Центральный_процессор), [**оперативную память**](https://ru.wikipedia.org/wiki/Оперативная_память), [видеокарту](https://ru.wikipedia.org/wiki/Видеокарта).

Доступ к аппаратным ресурсам — это не единственное, что предоставляет ОС. Кроме них есть программные ресурсы самой ОС. Это тот самый повторяющися код, ставший служебными программами и оформленный в [**системные библиотеки**](https://ru.wikipedia.org/wiki/Библиотека_(программирование)) (см. иллюстрацию 1-3). Например, компонент Windows под названием [**интерфейс графических устройств**](https://ru.wikipedia.org/wiki/GDI) позволяет приложениям манипулировать графическими объектами. С их помощью разработчики могут создавать графический интерфейс для своих программ. К этому типу ресурсов можно отнести все приложения и компоненты ОС, установленные на компьютере. Кроме собственных программ ОС может предоставлять доступ и к алгоритмам сторонних приложений или библиотек.

Кроме управления ресурсами, ОС организует работу запущенных приложений. Прежде всего код приложения должен быть загружен с [**устройства хранения информации**](https://ru.wikipedia.org/wiki/Компьютерная_память) (будь то перфокарта или жёсткий диск) и помещён в оперативную память компьютера. Эта процедура нетривиальная, поскольку код всех сторонних библиотек, которые требуются приложению для работы, также должен быть загружен в оперативную память. Процесс запуска и исполнения программы мы рассмотрим подробнее в следующем разделе.

Если ОС многопользовательская, она берёт на себя функции контроля доступа к данным. Таким образом каждый пользователь может работать только со своими собственными данными.

Подведём итог. ОС выполняет следующие функции:

1. Предоставляет доступ к аппаратным ресурсам компьютера.

2. Предоставляет программные ресурсы в виде системных библиотек.

3. Осуществляет запуск приложений.

4. Организует взаимодействие приложений друг с другом.

5. Контролирует доступ пользователей к своим данным.

Изучив эти функции, внимательный читатель возможно догадался, что без ОС невозможно одновременное выполнение нескольких приложений. Ведь их разработчики не могут предусмотреть в каком окружении будет запущена их программа. Только ОС имеет достаточно информации, чтобы эффективно распределить ресурсы компьютера.

### Современные ОС

Мы рассмотрели ОС в общих чертах. Теперь с учётом наших новых знаний поговорим о современных ОС. Они отличаются не столько предоставляемыми функциями, которые у всех почти одинаковы, сколько способами их реализации. Эти особенности реализации и решения, которые к ним привели, принято называть [**архитектурой**](https://ru.wikipedia.org/wiki/Архитектура_программного_обеспечения).

#### Многозадачность

Прежде всего следует заметить, что все современные ОС [**многозадачные**](https://ru.wikipedia.org/wiki/Многозадачность). Это значит, что они поддерживают одновременное исполнение нескольких программ. Почему так получилось?

ОС, которые использовались на первых [персональных компьютерах](https://ru.wikipedia.org/wiki/Персональный_компьютер#История) (PC), были однозадачными. Это было приемлемо, поскольку производительность таких компьютеров была значительно ниже чем у [мэйнфреймов](https://ru.wikipedia.org/wiki/Мейнфрейм), применявшихся в коммерческих целях и государственных проектах. То есть об эффективном одновременном выполнении нескольких программ на PC тогда не было и речи. Возможно, некоторые читатели работали с [MS-DOS](https://ru.wikipedia.org/wiki/MS-DOS). Это хороший пример однозадачной ОС.

Иллюстрация 1-4 демонстрирует персональный компьютер IBM 5150, получивший массовое распространение.

{caption: "Иллюстрация 1-4. Персональный компьютер IBM 5150", height: "30%"}
![IBM 5151](images/GeneralInformation/ibm-pc.jpg)

Увеличение мощности персональных компьютеров привело к значительному простою центрального процессора. Почему это произошло?

Представьте, что вы работаете над электронной таблицей. Например, заносите список сотрудников вашей компании и их контактные данные. Как бы быстро вы не печатали текст, между нажатиями клавиш проходят миллисекунды. По компьютерным масштабам это огромные промежутки времени, за которые процессор может успеть обработать немало информации. Теперь представьте, что вы забыли чей-то номер и уточняете его у кого-то. Теперь счёт пошёл на секунды и минуты. За это время современный процессор мог бы обработать бухгалтерский отчёт вашей фирмы. Мы рассмотрели только задержки ввода информации, но то же самое происходит и с выводом. Представтье, что на экран вывелось сообщение об ошибке. Несколько сотен миллисекунд у вас уйдёт только на то, чтобы понять, что произошло. Затем вы читаете сообщение. Думаю, вы уже поняли основную идею: в масштабах компьютерного времени пользователь очень медленно реагирует на события.

Чтобы процессор не простаивал, ОС может остановить выполнение приложения, ожидающего действия от пользователя, и предоставить аппаратные ресурсы другой программе, работающей параллельно. Именно в этом заключается суть многозадачности.

Существует несколько способов реализации многозадачности. В современных ОС применяется [**вытесняющая многозадачность**](https://ru.wikipedia.org/wiki/Вытесняющая_многозадачность) с псевдопараллельной обработкой задач. Это означает, что ОС самостоятельно принимает решение о том, какая задача будет выполняться в данный момент времени. При этом выборе учитываются приоритеты задач. То есть более приоритетные будут получать аппаратные ресурсы чаще, чем низкоприоритетные. Псевдопараллельность обработки означает, что в каждый момент времени выполняется одна-единственная задача. Это справедиво для процессоров с одним ядром. Современные процессоры обычно имеют несколько ядер. Поэтому число одновременно выполняемых задач, грубо говоря, равно числу ядер. Но принцип вытесняющей многозадачности с постоянным переключением задач сохраняется.

#### Интерфейс пользователя

Ещё одна общая черта современных ОС для персональных компьютеров и ноутбуков - это наличие [**графического интерфейса пользователя**](https://ru.wikipedia.org/wiki/Графический_интерфейс_пользователя). Благодаря ему пользователь может выбрать задачи или программы для запуска, а также манипулировать некоторыми ресурсами, предоставляемыми ОС (например, файловой системой). Пример графичесого интерфейса ОС Windows приведён на иллюстрации 1-5. На ней скриншот рабочего стола и окна трёх приложений: Проводника, Блокнота и Калькулятора.

{caption: "Иллюстрация 1-5. Графический интерфейс пользователя"}
![Графический интерфейс пользователя](images/GeneralInformation/gui.png)

Сегодня графический интерфейс кажется неотъемлемой частью ОС, но исторически возник далеко не сразу. На первых программируемых компьютерах для ввода и вывода информации использовались перфокарты. Таким образом пользователь загружал код программы и её исходные данные. После окончание работы, результаты печатались на принтере. Обслуживание такого интерфейса требовало минимум вычислительных ресурсов. Поэтому он хорошо подходил для маломощных компьютеров того времени.

С увеличением производительности компьютеров и устройств ввода-вывода появилась возможность интерактивного взаимодействия с пользователем в реальном времени. Возник [**интерфейс командной строки**](https://ru.wikipedia.org/wiki/Интерфейс_командной_строки), который позволяет вводить текстовые команды и выводить результат их исполнения на монитор. Основная проблема такого интерфейса заключается в сложности освоения. Список всех доступных команд, как правило, достаточно большой. При этом каждая из них имеет различные входные параметры. Чтобы запомнить хотя бы наиболее часто используемые команды и их параметры, надо потратить немало времени. Пример интерфейса командной строки приведён на иллюстрации 1-6. На ней вы видите окно интерпретатора Bash и вывод команд `ping` и `ls`.

{caption: "Иллюстрация 1-6. Интерфейс командной строки", height: "50%"}
![Интерфейс командной строки](images/GeneralInformation/cli.png)

Решение проблемы с наглядностью представления доступных команд привело к созданию [**текстового интерфейса пользователя**](https://ru.wikipedia.org/wiki/Текстовый_интерфейс_пользователя). В нём наряду с буквенными и цифровыми символами используется [**псевдографика**](https://ru.wikipedia.org/wiki/Псевдографика). Под псевдографикой подразумеваются специальные символы, отображающие графические примитивы (например, линии, прямоугольники, треугольники и т.д.). Пример текстового интерфейса пользователя приведён на иллюстрации 1-7. Это вывод монитора системных ресурсов `htop`.

{caption: "Иллюстрация 1-7. Текстовый интерфейс пользователя", height: "50%"}
![Текстовый интерфейс пользователя](images/GeneralInformation/tui.png)

Только благодаря увеличению вычислительной мощности компьютеров, стало возможно заменить текстовый интерфейс на хорошо знакомый нам графический.

#### Семейства ОС

Сегодня на рынке персональных компьютеров доминируют три основных семейства ОС:

* [Windows](https://ru.wikipedia.org/wiki/Windows)
* [Linux](https://ru.wikipedia.org/wiki/Linux)
* [macOS](https://ru.wikipedia.org/wiki/MacOS)

Может возникнуть вопрос: что именно подразумевается под семейством ОС? Этот термин означает ряд версий ОС, которые следуют одним и тем же архитектурным решениям, а также наследуют некоторые особенности реализации тех или иных функций.

Почему же разработчики каждой ОС предпочитают придерживаться одной и той же архитектуры, а не предлагают что-то принципиально новое в следующих версиях? На самом деле изменения в современных ОС происходят, но очень постепенно и медленно. Причина этого в так называемой [**обратной совместимости**](https://ru.wikipedia.org/wiki/Обратная_совместимость). Эта совместимость предполагает наличие некоторых старых функций в новой версии ОС. Эти старые функции нужны для корректной работы написанных ранее программ. На первый взгляд это требование может показаться совершенно неважным. Но на самом деле это настоящий бич разработки программного обеспечения. Давайте разберёмся, почему.

Представьте, что вы разработали программу для ОС Windows и продаёте её. Иногда в ней обнаруживаются ошибки, которые вы успешно исправляете. Иногда вы добавляете в неё новые функции. Теперь представьте, что выходит новая версия Windows, на которой ваша программа перестаёт работать. У пользователей есть два решения: ждать от вас новой версии программы или отказаться от перехода на новую версию Windows. Теперь предположим, что новая версия ОС принципиально отличается от предыдущей. Это значит, что вам придётся переписать вашу программу буквально с нуля. Представьте всё время, потраченное на исправление ошибок и добавление новых функций. Это всё придётся повторить. Скорее всего вы откажетесь от этой идеи и предложите пользователям оставаться на старой версии Windows. Теперь представьте, что таких программ и их разработчиков очень много. Все они придут к тому же решению, что и вы. В результате, новая версия Windows окажется никому не нужна. В этом и заключается проблема обратной совместимости. Именно поэтому и существуют семейства ОС.

I> Влияние приложений, доступных под конкретную ОС, сложно переоценить. Например, успех ОС Windows и персональных компьютеров от IBM во многом обусловлен табличным процессором [Lotus 1-2-3](https://ru.wikipedia.org/wiki/Lotus_1-2-3). Он был так называемым [killer application](https://ru.wikipedia.org/wiki/Killer_application) (убойное приложение), ради запуска которого пользователи были готовы покупать и IBM PC, и Windows. Аналогично табличный процессор [VisiCalc](https://ru.wikipedia.org/wiki/VisiCalc) способствовал распространению компьютеров [Apple II](https://ru.wikipedia.org/wiki/Apple_II), а бесплатные компиляторы языков C, Fortran и Pascal продвинули Unix в университетские круги. За каждой из трёх доминирующих сегодня ОС стоит какое-то killer application. Далее происходил [сетевой эффект](https://ru.wikipedia.org/wiki/Сетевой_эффект), когда разработчики программ выбирали в качестве целевой платформы именно ту ОС, которая уже была установлена у большинства пользователей.

Вернёмся к нашему списку семейств ОС. Windows и Linux примечательны тем, что не привязаны к конкретной аппаратной платформе. Это значит, что купив любой персональный компьютер или ноутбук, вы без особых трудностей сможете установить на него эти ОС. macOS в отличие от них рассчитана на запуск только на устройствах от Apple. Чтобы установить macOS на чём-то другом, вам потребуются её [модифицированная версия](https://ru.wikipedia.org/wiki/OSx86). Это хороший пример одного из архитектурных решений. Но таких решений много и все вместе они определяют особенности каждого семейства.

Неудивительно, что ОС во многом определяет инфраструктуру, доступную программисту. Она диктует не только инструменты разработки, такие как IDE, компилятор, система сборки, но и некоторые архитектурные решения в запускаемых на ней приложениях. Можно говорить о некоторой сложившейся культуре написания программ под конкретную ОС. Это очень важный момент, который следует всегда учитывать: под разные ОС принято разрабатывать программы по-разному.

Рассмотрим различие этих культур подробнее на примере Windows и Linux.

#### Windows

Как вам известно, Windows — это [проприетарная](https://ru.wikipedia.org/wiki/Проприетарное_программное_обеспечение) ОС. Это означает, что все её исходные коды закрыты для постороннего изучения и модификации. Вы не сможете законным способом узнать о ней больше, чем разработчики посчитают нужным вам сообщить. Чтобы установить Windows на свой компьютер, вам надо купить её у компании Microsoft. Однако, в большинстве случаев эта ОС уже предустановлена на новые компьютеры и ноутбуки, а её цена включена в стоимость устройства.

Обратите внимание, что целевая платформа Windows — это относительно дешёвые персональные компьютеры. Многие могут позволить себе купить такое устройство. Это огромный рынок потребителей. Поэтому Microsoft стремится всеми силами предотвратить конкуренцию. Компания не хочет, чтобы на рынке появлялись ОС, которые бы копировали возможности Windows. Это желание совершенно справедливо и оправдано. Именно поэтому Microsoft заботится о защите своей интеллектуальной собственности не только техническими, но и юридическими путями. Строго говоря, пользовательское соглашение запрещает вам исследовать внутреннее устройство ОС.

За время существования Windows под неё было написано очень много программ. Первые из них (например, пакет офисных приложений [Microsoft Office](https://ru.wikipedia.org/wiki/Microsoft_Office) или [стандартные приложения Windows](https://ru.wikipedia.org/wiki/Категория:Стандартные_приложения_Windows)) создавались самой компанией Microsoft. Для сторонних разработчиков они послужили в некотором роде образцом того, как следует писать программы под Windows. Очевидно, что Microsoft при разработке своих приложений придерживалась того же принципа закрытости, что и при разработке ОС: исходные коды недоступны конечным пользователям, форматы данных недокументированны, сторонние утилиты не могут получить доступа к возможностям приложений. Опять же это решение было продиктовано заботой о защите интеллектуальной собственности компании от конкурентов.

Сторонние разработчики программ последовали примеру Microsoft и стали придерживаться той же философии закрытости. Большинство получившихся приложений самодостаточны и независимы друг от друга. Форматы их данных, как правило, закодированы и недокументированны.

Если вы опытный пользователь компьютера, вы легко сможете представить себе типичное Windows приложение. Оно представляет собой окно с такими [элементами интерфейса](https://ru.wikipedia.org/wiki/Элемент_интерфейса), как кнопки, поля ввода, вкладки и т.д. Через это окно пользователь манипулирует данными (например текстом, изображением, звуковой записью и т.д.). Результат работы сохраняется на жёсткий диск компьютера и может быть повторно загружен в том же самом приложении. Очень велика вероятность, что если вы напишете собственную программу, она будет работать похожим образом. Именно такая преемственность решений и имеется ввиду, когда мы говорим о сложившейся культуре разработки под конкретную ОС.

#### Linux

Linux является идейным наследником ОС [Unix](https://ru.wikipedia.org/wiki/Unix) и следует её [**спецификациям**](https://ru.wikipedia.org/wiki/Спецификация). Спецификация - это документ с требованиями к системе, который также определяет её поведени и устройство. Получается, что Linux заимствовал многие идеи и решения Unix, что в результате привело к похожему поведению.

{caption: "Иллюстрация 1-8. Мэйнфрейм модели GE-645", height: "30%"}
![Мэйнфрейм модели GE-645](images/GeneralInformation/ge-645.jpg)

Сама Unix возникла в конце 1960-х годов. Она разрабатывалась как хобби-проект двумя инженерами компании Bell Labs: Кеном Томпсоном и Деннисом Ритчи. Всё началось с того, что Кен разработал компьютерную игру [Space Travel](https://ru.wikipedia.org/wiki/Space_Travel). Она запускалась на мэйнфреймах модели GE-645 (см. иллюстрацию 1-8) от компании General Electric, работающих под управлением ОС GECOS. Эти компьютеры представляли собой шкафы с электроникой, стоили порядка 7500000$, и их вычислительные ресурсы активно использовались для нужд компании. Поэтому Кен решил портировать свою игру на относительно недорогой [мини-компьютер](https://en.wikipedia.org/wiki/Minicomputer) [PDP-7](https://ru.wikipedia.org/wiki/PDP-7) (см. иллюстрацию 1-9) стоимостью порядка 72000$. Проблема была в том, что игра использовала возможности ОС GECOS, которые были недоступны на PDP-7. Поэтому Кену и присоединившемуся к нему Деннису пришлось реализовать несколько библиотек и систем, которые впоследствии развились в Unix.

{caption: "Иллюстрация 1-9. Мини-компьютер PDP-7", height: "30%"}
![Мини-компьютер PDP-7](images/GeneralInformation/pdp-7.jpg)

Очевидно, в своём проекте разработчики Unix не заботились о защите интеллектуальной собственности, поскольку не собирались продавать свою ОС. Она распространялась с открытым исходным кодом, доступным для изучения и модификации любым желающим. Изначально круг пользователей ограничивался сотрудниками компании Bell Labs. Позднее AT&T, которой принадлежала Bell Labs, предоставила исходный код Unix высшим учебным заведениям США. Таким образом развитие ОС продолжилось в университетских кругах.

Linux была [создана](https://habr.com/ru/post/95646) в 1991 году Линусом Торвальдсом во время его обучения в Хельсинкском университете. Проблема, которую пытался решить Линус заключалась в том, что в то время персональные компьютеры не имели полноценной Unix-совместимой ОС. В университете студенты работали на Unix, но дома у них не было оборудовния, подходящего для её запуска. Единственным вариантом была ОС [Minix](https://ru.wikipedia.org/wiki/Minix), разработанная Эндрю Таненбаумом в 1987 году для компьютеров IBM с процессорами Intel 80268. Но эта ОС разрабатывалась для учебных целей, и поэтому Эндрю отказывался вносить в неё изменения для поддержки более современных компьютеров. Эти изменения неизбежно привели бы к усложнению системы и сделали бы её менее подходящей для обучения студентов.

Линус задался целью написать Unix-совместимую ОС для своего нового компьютера IBM с процессором Intel 80386. Её прототипам стала учебная ОС Minix. Как и у создателей Unix, у него не было коммерческих интересов, связанных с продажей результата своего труда. Поэтому она стала бесплатной и свободно распространялась с исходным кодом через интернет.

На самом деле Linux — это не более чем ядро ОС, предоставляющее функции для работы с памятью, файловой системой, периферийными устройствами, а также управлением процессорным временем. Большинство функций системы были доступны через свободные [пользовательские компоненты GNU](https://ru.wikipedia.org/wiki/Проект_GNU), которые Линус включил в [дистрибутив](https://ru.wikipedia.org/wiki/Дистрибутив_Linux) своей ОС.

Изначально у Linux, как у и Unix, не было графической подсистемы. Все приложения пользователь запускал из командной строки. Некоторые из сложных приложений имели текстовый интерфейс. Со временем в Linux появилась оконная система [X Window System](https://ru.wikipedia.org/wiki/X_Window_System), а вместе с ней и более привычные Windows пользователям приложения с графическим интерфейсом.

Инфраструктура, в которой возник и развивался Linux, во многом определила культуру написания приложений. В ней предпочтение отдаётся узкоспециализированным утилитам командной строки, которые выполняют одну конкретную задачу. Результат работы таких утилит доступен для распространения через открытый формат данных (как правило [текстовый](https://ru.wikipedia.org/wiki/Текстовые_данные)), который можно прочитать в обычном текстовом редакторе. Исходный код самих утилит всегда доступен для модификации.

Культура Linux значительно отличается от стандартов разработки, принятых в Windows. В Windows каждое приложение монолитно и самостоятельно выполняет все необходимые для своей работы задачи. Оно не полагается на сторонние утилиты, которые могут оказаться платными или недоступными для пользователя по какой-то причине. Разработчик должен рассчитывать только на себя. Он не может требовать от пользователя купить что-то дополнительное для работы своего приложения. В Linux же подавляющее большинство утилит бесплатны, взаимозаменяемы и легко доступны через интернет. Поэтому вполне естественно, что какое-то приложение попросит установить и скачать недостающие ему системные компоненты или другое приложение.

Даже монолитные графические приложения в Linux очень часто имеют текстовый интерфейс. Таким образом они органично вписываются в экосистему и легко интегрируются с другими утилитами и приложениями.

Когда сложный вычислительный процесс строится на использовании набора отдельных узкоспециализированных приложений, становится насущным вопрос написания сценариев, по которому они должны выполняться. Именно для этой задачи была создана [командная оболочка](https://ru.wikipedia.org/wiki/Командная_оболочка_Unix) [Bourne shell](https://ru.wikipedia.org/wiki/Bourne_shell) и её потомок [Bash](https://ru.wikipedia.org/wiki/Bash). Эту командную оболочку мы рассмотрим далее в этой книге.

Подробнее о культуре Unix вы можете узнать из книги [Эрика Реймонда "Искусство программирования в Unix"](https://ru.wikipedia.org/wiki/Философия_Unix#Реймонд:_Искусство_программирования_в_Unix).