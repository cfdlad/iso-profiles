# git merge

> Dalları birleştir.
> Daha fazla bilgi için: <https://git-scm.com/docs/git-merge>.

- Mevcut dal ile belirtilen dalı birleştir:

`git merge {{dal_ismi}}`

- Birleştirme mesajını düzenle:

`git merge {{-e|--show-email}} {{dal_ismi}}`

- Bir dalı birleştir ve birleştirme commit'i oluştur:

`git merge --no-ff {{dal_ismi}}`

- Karışıklık durumlarına karşı birleştirme işlemini durdur:

`git merge --abort`