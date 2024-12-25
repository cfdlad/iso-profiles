# nano

> 命令行文本编辑器。一个功能更强的 `Pico` 克隆版。
> 更多信息：<https://nano-editor.org>.

- 启动编辑器：

`nano`

- 启动编辑器且不使用配置文件：

`nano --ignorercfiles`

- 打开指定文件，在关闭前一个文件后移动到下一个文件：

`nano {{路径/到/文件1 路径/到/文件2 ...}}`

- 打开文件并将光标定位到指定行和列：

`nano +{{行号}},{{列号}} {{路径/到/文件}}`

- 打开文件并启用软换行：

`nano --softwrap {{路径/到/文件}}`

- 打开文件并使新行缩进对齐到上一行：

`nano --autoindent {{路径/到/文件}}`

- 打开文件并在保存时创建备份文件（如 `路径/到/文件~`）：

`nano --backup {{路径/到/文件}}`