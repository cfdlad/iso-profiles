# mailx

> 메일을 보내고 받습니다.
> 더 많은 정보: <https://manned.org/mailx>.

- 메일 보내기 (명령어 입력 후 내용을 작성하고 `Ctrl+D`로 종료):

`mailx -s "{{제목}}" {{수신자_주소}}`

- 다른 명령의 출력을 메일 내용으로 보내기:

`echo "{{내용}}" | mailx -s "{{제목}}" {{수신자_주소}}`

- 파일에서 읽은 내용을 메일로 보내기:

`mailx -s "{{제목}}" {{수신자_주소}} < {{내용.txt}}`

- 메일을 보내고 다른 주소로 CC하기:

`mailx -s "{{제목}}" -c {{참조_주소}} {{수신자_주소}}`

- 발신자 주소를 지정하여 메일 보내기:

`mailx -s "{{제목}}" -r {{발신자_주소}} {{수신자_주소}}`

- 첨부 파일과 함께 메일 보내기:

`mailx -a {{경로/대상/파일}} -s "{{제목}}" {{수신자_주소}}`