# base64

> 파일 또는 표준 입력을 Base64와 표준 출력으로 인코딩하거나 디코딩함.
> 더 많은 정보: <https://manned.org/base64>.

- 파일 인코딩:

`base64 {{경로/대상/파일}}`

- 특정 너비로 ​​인코딩된 출력을 래핑합니다 (`0`은 래핑을 비활성화합니다):

`base64 {{-w|--wrap}} {{0|76|...}} {{경로/대상/파일}}`

- 파일 디코딩:

`base64 {{-d|--decode}} {{경로/대상/파일}}`

- `stdin`에서 인코딩:

`{{somecommand}} | base64`

- `stdin`에서 디코딩:

`{{somecommand}} | base64 {{-d|--decode}}`