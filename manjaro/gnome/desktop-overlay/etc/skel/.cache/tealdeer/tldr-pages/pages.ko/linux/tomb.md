# tomb

> 암호화된 저장 디렉터리를 관리하여 파일 시스템에서 안전하게 이동하고 숨길 수 있습니다.
> 더 많은 정보: <https://www.dyne.org/software/tomb/>.

- 초기 크기 100MB로 새로운 톰 생성:

`tomb dig -s {{100}} {{암호화된_디렉터리.tomb}}`

- 톰을 잠글 수 있는 새로운 키 파일 생성; 사용자에게 키에 대한 비밀번호를 요청함:

`tomb forge {{암호화된_디렉터리.tomb.key}}`

- 톰이 키 생성 허용하지 않아도(스왑으로 인해) 강제로 새로운 키 생성:

`tomb forge {{암호화된_디렉터리.tomb.key}} -f`

- `forge`로 생성한 키를 사용하여 빈 톰 초기화 및 잠금:

`tomb lock {{암호화된_디렉터리.tomb}} -k {{암호화된_디렉터리.tomb.key}}`

- 톰을 키를 사용하여 마운트(기본적으로 `/media`에), 일반 파일 시스템 디렉터리처럼 사용 가능하게 함:

`tomb open {{암호화된_디렉터리.tomb}} -k {{암호화된_디렉터리.tomb.key}}`

- 톰 닫기(프로세스가 사용 중이면 실패):

`tomb close {{암호화된_디렉터리.tomb}}`

- 모든 열린 톰을 강제로 닫고, 사용 중인 애플리케이션 종료:

`tomb slam all`

- 열린 모든 톰 나열:

`tomb list`