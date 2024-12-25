# move

> 파일 및 디렉토리를 이동 또는 이름을 변경합니다.
> PowerShell에서 이 명령어는 `Move-Item`의 별칭입니다. 이 문서는 `move`의 Command Prompt (`cmd`) 버전을 기준으로 작성되었습니다.
> 더 많은 정보: <https://learn.microsoft.com/windows-server/administration/windows-commands/move>.

- 동등한 PowerShell 명령어 문서 보기:

`tldr move-item`

- 목표가 기존 디렉토리가 아닐 때 파일 또는 디렉토리 이름 변경:

`move {{경로\대상\소스}} {{경로\대상\목표}}`

- 파일 또는 디렉토리를 기존 디렉토리로 이동:

`move {{경로\대상\소스}} {{경로\대상\기존_디렉토리}}`

- 드라이브 간에 파일 또는 디렉토리 이동:

`move {{C:\경로\대상\소스}} {{D:\경로\대상\목표}}`

- 기존 파일을 덮어쓰기 전에 확인 메시지를 표시 안함:

`move /Y {{경로\대상\소스}} {{경로\대상\기존_디렉토리}}`

- 기존 파일을 덮어쓰기 전에 확인 메시지를 표시, 파일 권한과 관계없이:

`move /-Y {{경로\대상\소스}} {{경로\대상\기존_디렉토리}}`