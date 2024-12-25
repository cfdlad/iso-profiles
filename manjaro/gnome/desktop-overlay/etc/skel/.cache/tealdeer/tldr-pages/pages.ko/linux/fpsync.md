# fpsync

> 여러 동기화 프로세스를 로컬 또는 여러 원격 워커에서 SSH를 통해 실행.
> 더 많은 정보: <https://www.fpart.org/fpsync/>.

- 디렉토리를 다른 위치로 재귀적으로 동기화:

`fpsync -v {{/경로/대상/소스/}} {{/경로/대상/목적지/}}`

- 디렉토리를 재귀적으로 최종 패스로 동기화 (각 동기화 작업에 rsync의 `--delete` 옵션 활성화):

`fpsync -v -E {{/경로/대상/소스/}} {{/경로/대상/목적지/}}`

- 디렉토리를 재귀적으로 8개의 동시 동기화 작업을 사용하여 목적지로 동기화:

`fpsync -v -n 8 -E {{/경로/대상/소스/}} {{/경로/대상/목적지/}}`

- 디렉토리를 재귀적으로 8개의 동시 동기화 작업을 두 개의 원격 워커(machin1 및 machine2)에 분산하여 목적지로 동기화:

`fpsync -v -n 8 -E -w login@machine1 -w login@machine2 -d {{/경로/대상/공유/디렉토리}} {{/경로/대상/소스/}} {{/경로/대상/목적지/}}`

- 디렉토리를 재귀적으로 4개의 로컬 워커를 사용하여 각 동기화 작업당 최대 1000개의 파일과 100MB를 전송하며 목적지로 동기화:

`fpsync -v -n 4 -f 1000 -s $((100 * 1024 * 1024)) {{/경로/대상/소스/}} {{/경로/대상/목적지/}}`

- 특정 `.snapshot*` 파일을 제외한 디렉토리를 재귀적으로 동기화 (참고: 옵션과 값은 파이프 문자로 구분해야 함):

`fpsync -v -O "-x|.snapshot*" {{/경로/대상/소스/}} {{/경로/대상/목적지/}}`