# lebab

> ES6/ES7로 코드 변환을 위한 JavaScript 모더나이저.
> 모든 예시에 대한 변환이 제공되어야 합니다.
> 더 많은 정보: <https://github.com/lebab/lebab>.

- 하나 이상의 쉼표로 구분된 변환을 사용하여 트랜스파일:

`lebab --transform {{변환1,변환2,...}}`

- 파일을 `stdout`으로 트랜스파일:

`lebab {{경로/대상/입력_파일}}`

- 파일을 지정된 출력 파일로 트랜스파일:

`lebab {{경로/대상/입력_파일}} --out-file {{경로/대상/출력_파일}}`

- 지정된 디렉토리, 글로브 또는 파일의 모든 `.js` 파일을 제자리에서 대체:

`lebab --replace {{디렉토리|글로브|파일}}`

- 도움말 표시:

`lebab --help`