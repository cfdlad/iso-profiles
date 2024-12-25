# 7za

> Архіватор файлів з високим ступенем стиснення.
> Подібний до `7z`, за винятком того, що він підтримує менше типів файлів, але є кросплатформним.
> Більше інформації: <https://manned.org/7za>.

- Архівувати ([a]rchive) файл або каталог:

`7za a {{шлях/до/архіву.7z}} {{шлях/до/файлу_або_каталогу}}`

- Зашифрувати існуючий архів (включаючи імена файлів):

`7za a {{шлях/до/зашифрованого_архіву.7z}} -p{{пароль}} -mhe={{on}} {{шлях/до/архіву.7z}}`

- Розпакувати (e[x]tract) архів, зберігаючи оригінальну структуру каталогів:

`7za x {{шлях/до/архіву.7z}}`

- Розпакувати (e[x]tract) архів у певний каталог:

`7za x {{шлях/до/архіву.7z}} -o{{шлях/до/каталогу}}`

- Розпакувати (e[x]tract) архів у `stdout`:

`7za x {{шлях/до/архіву.7z}} -so`

- Архівувати ([a]rchive) за допомогою певного типу архіву:

`7za a -t{{7z|bzip2|gzip|lzip|tar|...}} {{шлях/до/архіву.7z}} {{шлях/до/файлу_або_каталогу}}`

- Вивести ([l]ist) перелік вмісту архіву:

`7za l {{шлях/до/архіву.7z}}`

- Встановити рівень стиснення (вище означає більше стиснення, але повільніше):

`7za a {{шлях/до/архіву.7z}} -mx={{0|1|3|5|7|9}} {{шлях/до/файлу_або_каталогу}}`