# chpass

> 사용자 데이터베이스 정보 추가 또는 변경, 로그인 쉘 및 비밀번호 포함.
> 참고: Open Directory 시스템에서는 사용자의 비밀번호를 변경할 수 없으며, 대신 `passwd`를 사용하세요.
> 같이 보기: `passwd`.
> 더 많은 정보: <https://man.freebsd.org/cgi/man.cgi?chpass>.

- 현재 사용자에 대해 대화형으로 사용자 데이터베이스 정보 추가 또는 변경:

`su -c chpass`

- 현재 사용자에 대해 특정 로그인 [s]쉘 설정:

`chpass -s {{경로/대상/쉘}}`

- 특정 사용자에 대해 로그인 [s]쉘 설정:

`chpass -s {{경로/대상/쉘}} {{사용자명}}`

- 지정된 [l]위치에 있는 디렉터리 노드에서 사용자 기록 편집:

`chpass -l {{위치}} -s {{경로/대상/쉘}} {{사용자명}}`

- 사용자가 포함된 디렉터리 노드에 인증할 때 주어진 [u]사용자명 사용:

`chpass -u {{인증명}} -s {{경로/대상/쉘}} {{사용자명}}`