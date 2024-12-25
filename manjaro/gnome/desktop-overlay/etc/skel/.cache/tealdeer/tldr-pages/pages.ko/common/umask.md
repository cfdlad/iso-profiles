# umask

> 사용자가 새로 생성하는 파일에 대해 제한되는 읽기/쓰기/실행 권한을 관리.
> 더 많은 정보: <https://manned.org/umask>.

- 현재 마스크를 8진수 표기법으로 표시:

`umask`

- 현재 마스크를 기호(사람이 읽기 쉬운) 모드로 표시:

`umask -S`

- 모든 사용자에게 읽기 권한을 허용하도록 기호로 마스크 변경 (나머지 마스크 비트는 변경되지 않음):

`umask {{a+r}}`

- 파일 소유자에게는 권한을 제한하지 않고, 다른 모든 사용자에게는 모든 권한을 제한하도록 마스크를 8진수로 설정:

`umask {{077}}`