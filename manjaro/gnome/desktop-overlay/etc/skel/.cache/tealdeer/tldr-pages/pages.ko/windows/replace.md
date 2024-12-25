# replace

> 파일을 대체합니다.
> 추가 참고: `robocopy`, `move`, `copy`, `del`.
> 더 많은 정보: <https://learn.microsoft.com/windows-server/administration/windows-commands/replace>.

- 대상 파일을 소스 디렉토리의 파일로 대체:

`replace {{경로\대상\파일_또는_디렉토리}} {{경로\대상\대상_디렉토리}}`

- 기존 파일을 바꾸는 대신 대상 디렉토리에 파일을 추가:

`replace {{경로\대상\파일_또는_디렉토리}} {{경로\대상\대상_디렉토리}} /a`

- 여러 파일을 대상 디렉토리에 복사하고 대체하기 전에 대화형으로 확인:

`replace {{경로\대상\파일_또는_디렉토리}} {{경로\대상\대상_디렉토리}} /p`

- 읽기 전용 파일도 대체:

`replace {{경로\대상\파일_또는_디렉토리}} {{경로\대상\대상_디렉토리}} /r`

- 파일을 대체하기 전에 디스크를 삽입하도록 기다림 (원래는 플로피 디스크를 삽입하는 데 사용):

`replace {{경로\대상\파일_또는_디렉토리}} {{경로\대상\대상_디렉토리}} /w`

- 대상의 하위 디렉토리에 있는 모든 파일을 대체:

`replace {{경로\대상\파일_또는_디렉토리}} {{경로\대상\대상_디렉토리}} /s`

- 소스 디렉토리에 있는 파일보다 오래된 대상 디렉토리의 파일만 대체:

`replace {{경로\대상\파일_또는_디렉토리}} {{경로\대상\대상_디렉토리}} /u`

- 도움말 표시:

`replace /?`